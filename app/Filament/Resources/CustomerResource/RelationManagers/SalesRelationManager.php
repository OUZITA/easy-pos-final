<?php

namespace App\Filament\Resources\CustomerResource\RelationManagers;

use App\Filament\Resources\CustomerResource;
use App\Helpers\Util;
use App\Models\Product;
use App\Models\Sale;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Infolists\Components\Grid;
use Filament\Infolists\Components\IconEntry;
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

class SalesRelationManager extends RelationManager
{
    protected static string $relationship = 'sales';

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

    public function infolist(Infolist $infolist): Infolist
    {
        return $infolist
            ->schema([
                \Filament\Infolists\Components\Section::make('Purchase Information')
                    ->schema([
                        Grid::make(3)
                            ->schema([
                                TextEntry::make('id')
                                    ->label('Purchase ID')
                                    ->formatStateUsing(fn($state) => Util::formatSaleId($state))
                                    ->badge()
                                    ->color('success'),

                                TextEntry::make('sale_date')
                                    ->label('Purchase Date')
                                    ->badge()
                                    ->color('success')
                                    ->date('d/m/Y')
                                    ->icon('heroicon-o-calendar-days'),

                                TextEntry::make('user.name')
                                    ->label('Sold By')
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

                // Section::make('Sale Items')
                //     ->schema([
                //         RepeatableEntry::make('items')
                //             ->schema([
                //                 Split::make([
                //                     Grid::make(5)
                //                         ->schema([
                //                             ImageEntry::make('product.image')
                //                                 ->size('60px')
                //                                 ->label('Image'),
                //                             TextEntry::make('product.name')
                //                                 ->label('Product')
                //                                 ->weight(FontWeight::SemiBold)
                //                                 ->icon('heroicon-o-cube'),

                //                             TextEntry::make('qty')
                //                                 ->label('Quantity')
                //                                 ->badge()
                //                                 ->color('info'),

                //                             TextEntry::make('unit_price')
                //                                 ->label('Unit Price')
                //                                 ->money('USD')
                //                                 ->icon('heroicon-o-currency-dollar'),

                //                             TextEntry::make('sub_total')
                //                                 ->label('Sub Total')
                //                                 ->money('USD')
                //                                 ->weight(FontWeight::Bold)
                //                                 ->color('success')
                //                                 ->state(function ($record) {
                //                                     return $record->qty * $record->unit_price;
                //                                 }),
                //                         ]),
                //                 ])
                //             ])
                //             ->contained(false)
                //             ->hiddenLabel(),

                //         Grid::make(4)
                //             ->schema([
                //                 TextEntry::make('d')
                //                     ->label(''),
                //                 TextEntry::make('s')
                //                     ->label(''),
                //                 TextEntry::make('x')
                //                     ->label(''),

                //                 TextEntry::make('total_amount')
                //                     ->label('Total Amount')
                //                     ->state(function ($record) {
                //                         return $record->items->sum(function ($item) {
                //                             return $item->qty * $item->unit_price;
                //                         });
                //                     })
                //                     ->money('USD')
                //                     ->size('lg')
                //                     ->weight(FontWeight::Bold)
                //                     ->color('success')
                //                     ->icon('heroicon-o-currency-dollar'),
                //             ])
                //     ])
                //     ->collapsible(),
                \Filament\Infolists\Components\Section::make('Products')
                    ->description('Detailed of purchased products')
                    ->collapsed(false)
                    ->icon('heroicon-o-cube')
                    ->schema([
                        RepeatableEntry::make('items')
                            ->contained(false)
                            ->schema([
                                // Product Header
                                // Grid::make(1)
                                //     ->schema([
                                //         TextEntry::make('product.name')
                                //             ->label('Product Name')
                                //             ->weight(FontWeight::Bold)
                                //             ->size('lg')
                                //             ->icon('heroicon-o-cube')
                                //             ->color('primary'),
                                //     ]),


                                // Product Details Grid
                                Grid::make(8)
                                    ->schema([
                                        ImageEntry::make('product.image')
                                            ->size('60px')
                                            ->label('Image'),
                                        TextEntry::make('product.name')
                                            ->label('Name'),
                                        TextEntry::make('qty')
                                            ->label('Qty')
                                            // ->badge()
                                            // ->color('primary')
                                            // ->size('lg')
                                            ->weight(FontWeight::Bold),


                                        TextEntry::make('product.brand.name')
                                            ->label('Brand')
                                            // ->badge()
                                            // ->color('slate')
                                            ->placeholder('No Brand'),


                                        TextEntry::make('product.category.name')
                                            ->label('Category')
                                            // ->badge()
                                            // ->weight(FontWeight::Bold)
                                            // ->color('slate')
                                            ->placeholder('Uncategorized'),


                                        TextEntry::make('unit_price')
                                            ->label('Unit Price')
                                            ->money('USD'),
                                        // ->icon('heroicon-o-currency-dollar')
                                        // ->weight(FontWeight::Medium),


                                        TextEntry::make('discount')
                                            ->label('Discount')
                                            ->getStateUsing(fn($record) => $record->discount ?? 0)
                                            ->suffix('%')
                                            ->badge()
                                            ->color(fn($state) => $state > 0 ? 'warning' : 'gray'),
                                        // ->visible(fn($record) => ($record->discount ?? 0) > 0),


                                        TextEntry::make('sub_total')
                                            ->label('Sub Total')
                                            ->money('USD')
                                            ->weight(FontWeight::Bold)
                                            ->color('success')
                                            // ->size('lg')
                                            ->state(function ($record) {
                                                return $record->subTotal();
                                            }),
                                    ]),
                            ])
                            ->contained(true)
                            ->hiddenLabel()
                            ->extraAttributes([
                                'class' => 'border border-gray-200 dark:border-gray-700 rounded-lg p-4 mb-4 bg-white dark:bg-gray-900',
                            ]),
                    ])
                    ->collapsible()
                    ->collapsed(false)
                    ->persistCollapsed(),

                // Payment Summary Section
                \Filament\Infolists\Components\Section::make('Payment Summary')
                    ->description('Total amounts and payment details')
                    ->icon('heroicon-o-credit-card')
                    ->schema([
                        Grid::make(2)
                            ->schema([
                                // Total Amount Card
                                TextEntry::make('total_amount')
                                    ->label('Total Amount')
                                    ->state(function ($record) {
                                        $usdAmount = $record->total_price;
                                        $rielAmount = number_format(round($usdAmount * 4000, -2));
                                        return '$' . number_format($usdAmount, 2);
                                    })
                                    ->size('xl')
                                    ->weight(FontWeight::Bold)
                                    ->color('success')
                                    ->extraAttributes([
                                        'class' => 'text-center p-6 bg-blue-50 dark:bg-blue-900/20 rounded-xl border-2 border-blue-200 dark:border-blue-800',
                                    ]),


                                // Paid Amount Card
                                TextEntry::make('payment')
                                    ->label('Amount Paid')
                                    ->state(function ($record) {
                                        $usdAmount = $record->total_pay;
                                        if ($record->total_pay <= 0) {
                                            return '$' . number_format($record->total_price, 2);
                                        }
                                        // $rielAmount = number_format(round($usdAmount * 4000, -2));
                                        // $status = $usdAmount >= $record->total_price ? 'PAID' : 'PARTIAL';
                                        return '$' . number_format($usdAmount, 2);
                                    })
                                    ->size('xl')
                                    ->weight(FontWeight::Bold)
                                    ->color('success')
                                    ->extraAttributes([
                                        'class' => 'text-center p-6 bg-green-50 dark:bg-green-900/20 rounded-xl border-2 border-green-200 dark:border-green-800',
                                    ]),
                            ]),


                        // Change/Balance Due
                        Grid::make(1)
                            ->schema([
                                TextEntry::make('balance')
                                    ->label('')
                                    ->state(function ($record) {
                                        $total_pay = $record->total_pay ?? $record->total_price;
                                        $balance =  $total_pay - $record->total_price;
                                        if ($balance > 0) {
                                            return 'Change Due: $' . number_format($balance, 2);
                                        } else {
                                            return 'Fully Paid ✓';
                                        }
                                    })
                                    ->size('lg')
                                    ->weight(FontWeight::Bold)
                                    ->color('success')
                                    ->extraAttributes([
                                        'class' => 'text-center p-4 rounded-lg',
                                    ]),
                            ]),
                    ])
                    ->columns(1),
            ]);
    }


    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('name')
            ->heading("Purchase History")
            ->defaultSort('sale_date', 'desc')
            ->columns([
                Tables\Columns\TextColumn::make('id')
                    ->sortable()
                    ->toggleable()
                    ->label('Purchase ID')
                    ->weight(FontWeight::Bold)
                    ->formatStateUsing(fn($state) => Util::formatSaleId($state)),
                Tables\Columns\TextColumn::make('products')
                    ->label('Products')
                    ->state(fn(Sale $record) => $record->listProducts()),
                Tables\Columns\TextColumn::make('total_qty')
                    ->weight(FontWeight::Bold)
                    ->getStateUsing(fn(Sale $record) => $record->total_qty),
                Tables\Columns\TextColumn::make('total_price')
                    ->money(currency: 'usd')
                    ->weight(FontWeight::Bold)
                    ->color('danger')
                    ->sortable(query: fn(Builder $query, string $direction) => Sale::sortByTotalPrice($query, $direction))
                    ->formatStateUsing(fn($record) => '$' . number_format(
                        $record->items->sum(fn($item) => ($item->qty * $item->unit_price) * (1 - ($item->discount ?? 0) / 100)),
                        2
                    )),
                Tables\Columns\TextColumn::make('sale_date')
                    ->label('Purchase Date')
                    ->sortable()
                    ->dateTime('d/m/Y')
                    ->dateTooltip('d/M/Y')
                    ->toggleable(),
                Tables\Columns\TextColumn::make('total_price')
                    ->money(currency: 'usd')
                    ->weight(FontWeight::Bold)
                    ->color('success')
                    ->sortable(query: fn(Builder $query, string $direction) => Sale::sortByTotalPrice($query, $direction))
                    ->formatStateUsing(fn($record) => '$' . number_format(
                        $record->items->sum(fn($item) => ($item->qty * $item->unit_price) * (1 - ($item->discount ?? 0) / 100)),
                        2
                    )),
                Tables\Columns\TextColumn::make('note')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->html(),
                Tables\Columns\TextColumn::make('user.name')
                    ->label('Sold By')
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('user')
                    ->label('Sold By')
                    ->relationship('user', 'name') // <- nested relation
                    ->preload(),
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
            ])
            ->headerActions([
                Tables\Actions\CreateAction::make(),
            ])
            ->actions([
                Tables\Actions\ViewAction::make()
                    ->modalHeading('')
                    ->modalWidth('6xl'),
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }
}
