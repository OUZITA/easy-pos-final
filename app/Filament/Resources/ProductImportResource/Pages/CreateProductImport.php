<?php

namespace App\Filament\Resources\ProductImportResource\Pages;

use App\Filament\Resources\ProductImportResource;
use App\Models\Product;
use App\Models\Category;
use App\Models\Brand;
use Filament\Actions;
use Filament\Actions\CreateAction;
use Filament\Forms;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Log;

class CreateProductImport extends CreateRecord
{
    protected static string $resource = ProductImportResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $data['user_id'] = auth()->id();
        $data['import_date'] = now();
        return $data;
    }

    protected function getRedirectUrl(): string
    {
        return ProductImportResource::getUrl('index');
    }

    protected function afterCreate()
    {
        Log::info($this->record->items);
        $items = $this->record->items;
        // // Iterate over items
        foreach ($items as $item) {
            $product = Product::find($item->product_id);
            if ($product) {
                $product->increment('stock', $item->qty);
            }
        }
    }

    protected function getFormActions(): array
    {
        return [
            CreateAction::make()
                ->label('Stock In')
                ->color('success'),
        ];
    }

    protected function getHeaderActions(): array
    {
        return [
            Actions\Action::make('create_product')
                ->label('Add New Product')
                ->icon('heroicon-o-plus')
                ->modalHeading('Add New Product')
                ->form([
                    Forms\Components\Grid::make(2)
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
                                ->lazy()
                                ->extraAttributes([
                                    'onkeydown' => "if(['e','E','+','-'].includes(event.key)) event.preventDefault();",
                                    'oninput' => "if(this.value.length > 1) this.value = this.value.replace(/^0+/, ''); if(parseFloat(this.value) < 0.01) this.value = 0.01;",
                                ])
                                ->prefix('$')
                                ->placeholder('0.00')
                                ->minValue(0.01),
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
                            Forms\Components\Select::make('brand_id')
                                ->label('Brand')
                                ->options(Brand::where('active', true)->pluck('name', 'id'))
                                ->required()
                                ->searchable()
                                ->placeholder('Select brand')
                                ->createOptionForm([
                                    Forms\Components\TextInput::make('name')
                                        ->required()
                                        ->unique(Brand::class, 'name')
                                        ->maxLength(255),
                                ])
                                ->createOptionUsing(fn(array $data) => Brand::create($data)->id),
                            Forms\Components\TextInput::make('stock_security')
                                ->label('Low Stock Alert')
                                ->required()
                                ->numeric()
                                ->lazy()
                                ->extraAttributes([
                                    'onkeydown' => "if(['e','E','+','-'].includes(event.key)) event.preventDefault();",
                                    'oninput' => "if(this.value.length > 1) this.value = this.value.replace(/^0+/, ''); if(parseFloat(this.value) < 1) this.value = 1;",
                                ])
                                ->minValue(1),
                        ]),
                    Forms\Components\RichEditor::make('description')
                        ->label('Product Description')
                        ->placeholder('Describe your product in detail...')
                        ->columnSpanFull(),
                    Forms\Components\FileUpload::make('image')
                        ->label('Product Image')
                        ->image()
                        ->preserveFilenames()
                        ->imageEditor()
                        ->acceptedFileTypes(['image/jpeg', 'image/png', 'image/webp'])
                        ->directory('products')
                        ->disk('public')
                        ->visibility('public')
                        ->maxSize(2048),
                    Forms\Components\Toggle::make('active')
                        ->default(true)
                        ->required(),
                ])
                ->modalWidth('6xl')
                ->action(function (array $data) {
                    Product::create($data);
                    Notification::make()
                        ->title('Product created successfully!')
                        ->success()
                        ->send();
                }),
        ];
    }
}
