<?php

namespace App\Filament\Resources\SupplierResource\RelationManagers;

use App\Models\Product;
use App\Models\ProductImport;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Infolists\Components\Grid;
use Filament\Infolists\Components\ImageEntry;
use Filament\Infolists\Components\RepeatableEntry;
use Filament\Infolists\Components\Section;
use Filament\Infolists\Components\Split;
use Filament\Infolists\Components\TextEntry;
use Filament\Infolists\Infolist;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Support\Enums\FontWeight;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ProductImportsRelationManager extends RelationManager
{
    protected static string $relationship = 'productImports';

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                    ->required()
                    ->maxLength(255),
            ]);
    }

    public function isReadOnly(): bool
    {
        return true;
    }


    public function table(Table $table): Table
    {
        return $table
            ->heading('Stock in History')
            ->recordTitleAttribute('name')
            ->columns([
                Tables\Columns\TextColumn::make('id')
                    ->toggledHiddenByDefault(true)
                    ->label('Stock in ID')
                    ->searchable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('import_date')
                    ->label('Stock In Date')
                    ->date('d/m/Y')
                    ->dateTooltip('d/M/Y')
                    ->sortable(),

                Tables\Columns\TextColumn::make('products')
                    ->wrap()
                    ->getStateUsing(fn(ProductImport $record) => $record->listProducts()),

                Tables\Columns\TextColumn::make('qty')
                    ->label('Total Qty')
                    ->weight(FontWeight::Bold)
                    ->getStateUsing(fn(ProductImport $record) => $record->totalQty()),
                Tables\Columns\TextColumn::make('total_price')
                    ->money(currency: 'usd')
                    ->color('danger')
                    ->getStateUsing(fn(ProductImport $record) => $record->totalPrice())
                    ->sortable(query: fn(Builder $query, string $direction) => ProductImport::sortByTotalPrice($query, $direction))
                    ->weight(FontWeight::Bold),
                Tables\Columns\TextColumn::make('note')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->html(),
                Tables\Columns\TextColumn::make('user.name')
                    ->toggleable()
                    ->label('Stocked By'),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('user')
                    ->label('Stock By')
                    ->relationship('user', 'name')
                    ->preload()
                    ->searchable(),
                Tables\Filters\SelectFilter::make('product')
                    ->label('Product')
                    ->options(function () {
                        return Product::query()
                            ->orderBy('name')
                            ->pluck('name', 'id')
                            ->toArray();
                    })
                    ->query(function (Builder $query, array $data): Builder {
                        return $query->when(
                            filled($data['values']),
                            fn(Builder $query): Builder => $query->whereHas(
                                'items.product',
                                fn(Builder $query): Builder => $query->whereIn('id', $data['values'])
                            )
                        );
                    })
                    ->multiple()
                    ->preload(),
            ])->headerActions([
                Tables\Actions\CreateAction::make(),
            ])
            ->actions([
                Tables\Actions\ViewAction::make()
                    ->label('View')
                    //->modalHeading(fn(ProductImport $record) => 'Stock In Details — #' . $record->id)
                    ->modalHeading('')
                    ->modalWidth('7xl'),
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public function infolist(Infolist $infolist): Infolist
    {
        return $infolist
            ->schema([
                \Filament\Infolists\Components\Section::make('Product Stock in Information')
                    ->schema([
                        Grid::make(3)
                            ->schema([
                                TextEntry::make('id')
                                    ->label('Stock in ID')
                                    ->badge()
                                    ->color('success'),

                                TextEntry::make('import_date')
                                    ->label('Stock in Date')
                                    ->badge()
                                    ->color('success')
                                    ->date('d/m/Y')
                                    ->icon('heroicon-o-calendar-days'),
                                TextEntry::make('user.name')
                                    ->label('Stock by')
                                    ->icon('heroicon-o-user-circle')
                                    ->badge()
                                    ->color('success'),
                            ]),
                        Grid::make(1)
                            ->schema([
                                TextEntry::make('note')
                                    ->label('Notes')
                                    ->html()
                                    ->extraAttributes([
                                        'class' => 'p-4 bg-gray-50 rounded-lg',
                                    ])
                            ])
                    ])

                    ->columns(1),

                \Filament\Infolists\Components\Section::make('Product Items')
                    // ->description('Detailed of purchased products')
                    ->collapsed(false)
                    ->icon('heroicon-o-cube')
                    ->schema([
                        RepeatableEntry::make('items')
                            ->contained(false)
                            ->schema([
                                // Product Details Grid
                                Grid::make(7)
                                    ->schema([
                                        ImageEntry::make('product.image')
                                            // ->width(60)
                                            ->size(100)
                                            ->label('Image')
                                            ->alignStart(),
                                        TextEntry::make('product.name')
                                            ->label('Product')
                                            ->weight(FontWeight::SemiBold),

                                        TextEntry::make('qty')
                                            ->label('Quantity')
                                            ->badge()
                                            ->color('info'),
                                        TextEntry::make('product.brand.name')
                                            ->label('Brand')
                                            ->badge()
                                            ->color('success'),
                                        TextEntry::make('product.category.name')
                                            ->label('Category')
                                            ->badge()
                                            ->color('success'),


                                        TextEntry::make('unit_price')
                                            ->label('Unit Price')
                                            ->money('USD'),
                                        // ->icon('heroicon-o-currency-dollar'),


                                        TextEntry::make('sub_total')
                                            ->label('Sub Total')
                                            ->money('USD')
                                            ->weight(FontWeight::Bold)
                                            ->color('danger')
                                            ->state(function ($record) {
                                                return $record->qty * $record->unit_price;
                                            }),
                                    ]),
                            ])
                            ->contained(true)
                            ->hiddenLabel()
                            ->extraAttributes([
                                'class' => 'border border-gray-200 dark:border-gray-700 rounded-lg p-4 mb-4 bg-white dark:bg-gray-900',
                            ]),
                        Grid::make(6)
                            ->schema([
                                // TextEntry::make('total_items')
                                //     ->label('Total Items')
                                //     ->state(function ($record) {
                                //         return $record->items->sum('qty');
                                //     })
                                //     ->badge()
                                //     ->color('info')
                                //     ->icon('heroicon-o-list-bullet'),
                                TextEntry::make('d')
                                    ->label(''),
                                TextEntry::make('s')
                                    ->label(''),
                                TextEntry::make('x')
                                    ->label(''),
                                TextEntry::make('z')
                                    ->label(''),
                                TextEntry::make('zz')
                                    ->label(''),
                                TextEntry::make('total_amount')
                                    ->label('Total Amount')
                                    ->state(function ($record) {
                                        return $record->items->sum(function ($item) {
                                            return $item->qty * $item->unit_price;
                                        });
                                    })
                                    ->money('USD')
                                    ->size('lg')
                                    ->weight(FontWeight::Bold)
                                    ->color('danger')
                                    ->icon('heroicon-o-currency-dollar'),
                            ])
                    ])
                    ->collapsible()
                    ->collapsed(false)
                    ->persistCollapsed(),
            ]);
    }
}
