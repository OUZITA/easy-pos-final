<?php

namespace App\Filament\Resources\BrandResource\RelationManagers;

use App\Enums\Role;
use App\Helpers\Util;
use App\Models\Category;
use App\Models\Product;
use Filament\Forms;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\Section;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\Auth;

class ProductsRelationManager extends RelationManager
{
    protected static string $relationship = 'products';

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Product Information')
                    ->icon('heroicon-m-information-circle')
                    ->schema([
                        Grid::make(2)
                            ->schema([
                                Forms\Components\TextInput::make('name')
                                    ->label('Product Name')
                                    ->required()
                                    ->maxLength(255)
                                    ->placeholder('Enter product name')
                                    ->unique(Product::class, 'name', ignoreRecord: true)
                                    ->live(),
                                Forms\Components\TextInput::make('price')
                                    ->label('Price')
                                    ->required()
                                    ->numeric()
                                    ->rule('numeric')
                                    ->step('0.01')
                                    ->lazy()
                                    ->extraAttributes([
                                        'onkeydown' => "
                                            if(['e','E','+','-'].includes(event.key)) event.preventDefault();
                                            if(event.key === '0' && event.target.value.length === 0) event.preventDefault();
                                        ",
                                        'oninput' => "
                                            if(this.value.length > 1) this.value = this.value.replace(/^0+/, '');
                                            if(this.value === '' || parseFloat(this.value) < 0) this.value = 0;
                                        ",
                                    ])
                                    ->prefix('$')
                                    ->placeholder('0.00')
                                    ->minValue(0.01)
                                    ->afterStateUpdated(function ($state, callable $set) {
                                        $state = ltrim((string) $state, '0');
                                        if ($state === '' || !is_numeric($state)) {
                                            $state = 0;
                                        }
                                        $state = floor((float) $state * 100) / 100;

                                        if ($state < 0.01) {
                                            $set('price', 0.01);
                                            \Filament\Notifications\Notification::make()
                                                ->title('Price must be at least 0.01')
                                                ->danger()
                                                ->send();
                                        } else {
                                            $set('price', $state);
                                        }
                                    }),
                                Forms\Components\Select::make('category_id')
                                    ->label('Category')
                                    ->options(Category::where('active', true)->pluck('name', 'id'))
                                    ->required()
                                    ->searchable()
                                    ->placeholder('Select category')
                                    ->createOptionForm([
                                        Forms\Components\TextInput::make('name')
                                            ->required()
                                            ->unique(Category::class, 'name')
                                            ->maxLength(255),
                                    ])
                                    ->createOptionUsing(fn(array $data) => Category::create($data)->id),
                                Forms\Components\TextInput::make('stock_security')
                                    ->label('Low Stock Alert')
                                    ->required()
                                    ->numeric()
                                    ->lazy()
                                    ->extraAttributes([
                                        'step' => '1',
                                        'onkeydown' => "
                if(['e','E','+','-','.'].includes(event.key)) event.preventDefault();
                if(event.key === '0' && event.target.value.length === 0) event.preventDefault();
            ",
                                        'oninput' => "
                this.value = this.value.replace(/^0+/, '');
                if(this.value === '' || parseInt(this.value) < 1) this.value = 1;
                this.value = this.value.replace(/[^0-9]/g, '');
            ",
                                    ])
                                    ->minValue(1),

                            ]),

                        Forms\Components\RichEditor::make('description')
                            ->nullable()
                            ->label('Product Description')
                            ->placeholder('Describe your product in detail...')
                            ->columnSpanFull(),

                    ]),

                // Media Section
                Section::make('Product Media')
                    ->description('Upload product images')
                    ->icon('heroicon-m-photo')
                    ->schema([
                        Forms\Components\FileUpload::make('image')
                            ->label('Product Image')
                            ->image()
                            ->nullable()
                            ->preserveFilenames()
                            ->imageEditor()
                            ->acceptedFileTypes(['image/jpeg', 'image/png', 'image/webp'])
                            ->directory('products')
                            ->disk('public')
                            ->visibility('public')
                            ->maxSize(2048)
                            ->columnSpanFull(),
                    ]),
                Forms\Components\Toggle::make('active')
                    ->default(true)
                    ->required(),

            ])
            ->columns(1);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('name')
            ->columns([
                Tables\Columns\ImageColumn::make('image')
                    ->label('Image')
                    ->size(60)
                    ->defaultImageUrl(fn($record) => Util::getDefaultAvatar($record->name)),

                Tables\Columns\TextColumn::make('name')
                    ->label('Product Name')
                    ->searchable()
                    ->sortable()
                    ->weight('medium'),

                Tables\Columns\TextColumn::make('category.name')
                    ->label('Category')
                    ->badge()
                    ->color('info'),

                Tables\Columns\TextColumn::make('price')
                    ->label('Price')
                    ->money()
                    ->sortable(),

                Tables\Columns\TextColumn::make('stock')
                    ->label('Stock')
                    ->sortable()
                    ->badge()
                    ->color(fn($record) => match (true) {
                        $record->stock <= 0 => 'danger',
                        $record->stock <= $record->stock_security => 'warning',
                        default => 'success'
                    })
                    ->icon(fn($record) => match (true) {
                        $record->stock <= 0 => 'heroicon-m-x-circle',
                        $record->stock <= $record->stock_security => 'heroicon-m-exclamation-triangle',
                        default => 'heroicon-m-check-circle'
                    }),

                Tables\Columns\IconColumn::make('active')
                    ->label('Status')
                    ->boolean()
                    ->trueIcon('heroicon-m-check-circle')
                    ->falseIcon('heroicon-m-x-circle')
                    ->trueColor('success')
                    ->falseColor('danger'),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('category')
                    ->relationship('category', 'name')
                    ->preload()
                    ->multiple(),

                Tables\Filters\TernaryFilter::make('active')
                    ->label('Status')
                    ->placeholder('All products')
                    ->trueLabel('Active only')
                    ->falseLabel('Inactive only'),
            ])
            ->headerActions([
                Tables\Actions\CreateAction::make()
                    ->label('Add New Product')
                    ->icon('heroicon-m-plus')
                    ->modalWidth('6xl')
                    ->visible(fn() => Auth::user()?->role !== Role::Cashier),
            ])
            ->actions([
                Tables\Actions\EditAction::make()
                    ->label('Edit')
                    ->icon('heroicon-m-pencil-square')
                    ->modalWidth('6xl')
                    ->hidden(fn() => Auth::user()?->role === Role::Cashier),
            ])
            ->bulkActions([
                Tables\Actions\BulkAction::make('activate')
                    ->label('Activate Selected')
                    ->icon('heroicon-m-check-circle')
                    ->color('success')
                    ->requiresConfirmation()
                    ->action(fn(Collection $records) => $records->each->update(['active' => true])),

                Tables\Actions\BulkAction::make('deactivate')
                    ->label('Deactivate Selected')
                    ->icon('heroicon-m-x-circle')
                    ->color('danger')
                    ->requiresConfirmation()
                    ->action(fn(Collection $records) => $records->each->update(['active' => false])),
            ]);
    }
}
