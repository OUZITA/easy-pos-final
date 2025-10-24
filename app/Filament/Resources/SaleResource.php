<?php

namespace App\Filament\Resources;

use App\Filament\Exports\DetailedSaleExporter;
use App\Filament\Exports\SaleExporter;
use App\Filament\Exports\SaleItemExporter;
use App\Filament\Pages\ShopPage;
use App\Filament\Resources\SaleResource\Widgets\SaleStats;
use App\Models\Sale;
use App\Models\Customer;
use Filament\Actions\ExportAction;
use App\Models\Product;
use App\Models\SaleItem;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use App\Filament\Resources\SaleResource\Pages;
use App\Helpers\Util;
use Filament\Actions\Action;
use Filament\Actions\Exports\Enums\ExportFormat;
use Filament\Forms\Components\DatePicker;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Forms\Components\Section;
use Filament\Infolists\Components\Grid;
use Filament\Forms\Components\Repeater;
use Filament\Infolists\Components\TextEntry;
use Filament\Infolists\Components\RepeatableEntry;
use Filament\Infolists\Components\Split;
use Filament\Support\Enums\FontWeight;
use Filament\Forms\Get;
use Filament\Forms\Set;
use Filament\Infolists\Components\ImageEntry;
use Filament\Infolists\Infolist;
use Filament\Tables\Actions\ExportAction as ActionsExportAction;
use Filament\Tables\Actions\ExportBulkAction;
use Filament\Tables\Filters\Filter;
use Illuminate\Support\Facades\Log;
use OpenSpout\Common\Entity\Style\CellAlignment;

class SaleResource extends Resource
{
    protected static ?string $model = Sale::class;
    protected static ?string $navigationIcon = 'heroicon-m-shopping-cart';
    protected static ?string $navigationLabel = 'Sales';
    protected static ?string $modelLabel = 'Sale';
    protected static ?string $pluralModelLabel = 'Sales';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Group::make()
                    ->schema([
                        Forms\Components\Section::make()
                            ->schema(static::getDetailsFormSchema())
                            ->columns(2),

                        Forms\Components\Section::make('Sale Items')
                            ->schema([
                                static::getItemsRepeater(),
                            ]),
                    ])
                    ->columnSpan(['lg' => fn(?Sale $record) => $record === null ? 3 : 2]),
            ]);
    }

    public static function getDetailsFormSchema(): array
    {
        return [
            Forms\Components\Select::make('customer_id')
                ->relationship(
                    'customer',
                    'name',
                    fn($query) => $query->where('active', true)
                )
                ->preload()
                ->searchable()
                ->required()
                ->createOptionForm([
                    Forms\Components\TextInput::make('name')
                        ->required()
                        ->maxLength(255),
                    Forms\Components\TextInput::make('phone')
                        ->maxLength(255),
                ]),
            Forms\Components\DatePicker::make('sale_date'),
            // ->columnSpan('full'),

            Forms\Components\RichEditor::make('note')
                ->columnSpan('full'),
        ];
    }

    public static function getItemsRepeater(): Repeater
    {
        return Repeater::make('items')
            ->relationship()
            ->schema([
                Forms\Components\Select::make('product_id')
                    ->label('Product')
                    ->relationship('product', 'name', fn(Builder $query) => $query->where('active', true)->where('stock', '>', 0))
                    ->preload()
                    ->required()
                    // ->reactive()
                    ->afterStateUpdated(
                        function ($state, Forms\Set $set, Forms\Get $get) {
                            $product = Product::find($state);
                            if ($product) {
                                $set('unit_price', $product->price ?? 0);
                                $set('available_stock', $product->stock ?? 0);
                            }
                        }
                    )
                    ->distinct()
                    ->disableOptionsWhenSelectedInSiblingRepeaterItems()
                    ->searchable(),
                Forms\Components\TextInput::make('qty')
                    ->label('Quantity')
                    ->numeric()
                    ->extraAttributes([
                        'onkeydown' => "if(['e','E','+','-'].includes(event.key)) event.preventDefault();",
                    ])
                    ->default(1)
                    ->minValue(1)
                    ->maxValue(fn(Get $get) => $get('available_stock'))
                    ->validationMessages([
                        'max' => 'The product in stock have only :max.',
                    ])
                    ->required(),

                Forms\Components\TextInput::make('discount')
                    ->default(0),
                Forms\Components\TextInput::make('available_stock')
                    ->label('In Stock')
                    ->disabled()
                    ->dehydrated(false),

                Forms\Components\TextInput::make('unit_price')
                    ->label('Unit Price')
                    ->disabled()
                    ->dehydrated()
                    ->prefix('$')
                    ->required(),
            ])
            ->orderColumn('')
            ->defaultItems(1)
            ->hiddenLabel()
            ->columns(5)
            ->required();
    }

    public static function getWidgets(): array
    {
        return [
            // SaleStats::class
        ];
    }


    // Table Display
    public static function table(Table $table): Table
    {
        return $table
            // ->recordUrl(null) //disable clickable row
            ->columns([
                Tables\Columns\TextColumn::make('id')
                    ->label('Sale #')
                    ->searchable()
                    ->formatStateUsing(fn($state) => Util::formatSaleId($state))
                    ->sortable(),
                Tables\Columns\TextColumn::make('customer.name')
                    // ->tooltip('View customer information')
                    ->searchable()
                    ->sortable(),
                // ->url(
                //     fn($record) => CustomerResource::getUrl('customer.view', ['record' => $record->customer_id ?? null]),
                //     shouldOpenInNewTab: true
                // ),

                Tables\Columns\TextColumn::make('products')
                    ->label('Products')
                    ->wrap()
                    ->getStateUsing(fn(Sale $record) => $record->listProducts()),

                Tables\Columns\TextColumn::make('total_qty')
                    ->label('Total Qty')
                    ->weight(FontWeight::Bold)
                    ->getStateUsing(fn(Sale $record) => $record->total_qty),

                Tables\Columns\TextColumn::make('total_price')
                    ->label('Total Price')
                    ->sortable(
                        query: fn(Builder $query, string $direction) =>
                        $query->addSelect([
                            'discounted_total' => SaleItem::selectRaw(
                                'SUM(qty * unit_price * (1 - COALESCE(discount, 0) / 100))'
                            )
                                ->whereColumn('sales.id', 'sale_items.sale_id')
                        ])
                            ->orderBy('discounted_total', $direction)
                    )

                    ->formatStateUsing(fn($record) => '$' . number_format(
                        $record->items->sum(fn($item) => ($item->qty * $item->unit_price) * (1 - ($item->discount ?? 0) / 100)),
                        2
                    ))
                    ->color('success')
                    ->weight(FontWeight::Bold),

                Tables\Columns\TextColumn::make('sale_date')
                    ->label('Sale Date')
                    ->sortable()
                    ->dateTime('d/m/Y')
                    ->dateTooltip('d/M/Y')
                    ->toggleable(),
                Tables\Columns\TextColumn::make('user.name')
                    ->searchable()
                    ->label('Sold By'),
                Tables\Columns\TextColumn::make('note')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->html(),
                Tables\Columns\TextColumn::make('created_at')
                    ->label('Created At')
                    ->sortable()
                    ->dateTime('d/m/Y')
                    ->dateTooltip('d/M/Y')
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                Filter::make('sale_date')
                    ->form([
                        DatePicker::make('sale_from')
                            ->label('Sale From'),
                        DatePicker::make('sale_until')
                            ->label('Sale Until'),
                    ])
                    ->query(function (Builder $query, array $data): Builder {
                        return $query
                            ->when(
                                $data['sale_from'],
                                callback: fn(Builder $query, $date): Builder => $query->whereDate('sale_date', '>=', $date),
                            )
                            ->when(
                                $data['sale_until'],
                                fn(Builder $query, $date): Builder => $query->whereDate('sale_date', '<=', $date),
                            );
                    }),

                Tables\Filters\SelectFilter::make('customer')
                    ->preload()
                    ->searchable()
                    ->relationship('customer', titleAttribute: 'name'),
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
                    // ->searchable()
                    ->multiple()
                    ->preload(),
                Tables\Filters\SelectFilter::make('Seller')
                    ->preload()
                    ->searchable()
                    ->multiple()
                    ->relationship('user', 'name'),

            ])

            ->actions([
                Tables\Actions\ViewAction::make()->modalWidth('6xl')
                    ->modalHeading(''),
                //Tables\Actions\EditAction::make(), //not use
                Tables\Actions\DeleteAction::make()
                    ->before(function (Sale $record) {
                        Log::info($record);
                        foreach ($record->items as $item) {
                            $product = $item->product;
                            $product->increment('stock', $item->qty);
                        }
                    })
            ])
            ->bulkActions([
                ExportBulkAction::make()
                    ->color('primary')
                    ->exporter(SaleExporter::class)
                // ->formats([
                //     ExportFormat::Xlsx,
                // ]),
            ])
            // ->headerActions([
            //     ActionsExportAction::make()
            //         ->exporter(SaleExporter::class)
            //         ->formats([
            //             EnumsExportFormat::Xlsx
            //         ]),
            // ])
            // ->groupedBulkActions([
            //     Tables\Actions\DeleteBulkAction::make()
            // ])
            // ->groups([
            //     Tables\Grouping\Group::make('sale_date')
            //         ->label('Order Date')
            //         ->date()
            //         ->collapsible(),
            // ])
            ->defaultSort('created_at', 'desc');
    }

    // InfoList Display
    public static function infolist(Infolist $infolist): Infolist
    {
        return $infolist
            ->schema([
                // Main Sale Information Section
                \Filament\Infolists\Components\Section::make('Sale Overview')
                    ->description('Sale and customer information')
                    ->icon('heroicon-o-shopping-cart')
                    // ->collapsed(false)
                    ->schema([
                        // Sale Details Row
                        Grid::make(4)
                            ->schema([
                                TextEntry::make('id')
                                    ->label('Sale ID')
                                    ->badge()
                                    ->formatStateUsing(fn($state) => Util::formatSaleId($state))
                                    ->color('primary')
                                    ->icon('heroicon-o-hashtag')
                                    ->size('lg'),


                                TextEntry::make('sale_date')
                                    ->label('Sale Date')
                                    ->date('M j, Y')
                                    ->icon('heroicon-o-calendar-days')
                                    ->badge()
                                    ->color('gray'),


                                TextEntry::make('created_at')
                                    ->label('Created')
                                    ->since()
                                    ->icon('heroicon-o-clock')
                                    ->badge()
                                    ->color('gray'),


                                TextEntry::make('user.name')
                                    ->label('Sold By')
                                    ->icon('heroicon-o-user-circle')
                                    ->badge()
                                    ->color('info')
                                    ->weight(FontWeight::Medium),
                            ]),


                        // Customer Information Row
                        Grid::make(4)
                            ->schema([
                                TextEntry::make('customer.name')
                                    ->label('Customer Name')
                                    ->icon('heroicon-o-user')
                                    ->badge()
                                    ->color('success')
                                    ->weight(FontWeight::SemiBold)
                                    ->size('lg'),

                                TextEntry::make('customer.phone')
                                    ->label('Phone Number')
                                    ->icon('heroicon-o-phone')
                                    ->badge()
                                    ->color('success')
                                    ->weight(FontWeight::Medium)
                                    ->copyable()
                                    ->copyMessage('Phone number copied!')
                                    ->copyMessageDuration(1500),
                            ]),


                        // Notes Section
                        TextEntry::make('note')
                            ->label('Order Notes')
                            ->html()
                            ->columnSpanFull()
                            ->placeholder('No additional notes')
                            ->extraAttributes([
                                'class' => 'p-4 bg-gray-50 dark:bg-gray-800 rounded-xl border border-gray-200 dark:border-gray-700',
                            ])
                            ->visible(fn($record) => !empty($record->note)),
                    ])
                    ->columns(1)
                    ->collapsible()
                    ->collapsed(false)
                    ->persistCollapsed(),


                // Products Section
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


                // Actions Section
                \Filament\Infolists\Components\Section::make('')
                    ->schema([
                        TextEntry::make('print_button')
                            ->label('')
                            ->html()
                            ->state(function ($record) {
                                return '
                                    <div class="flex justify-end">
                                        <a href="' . route('receipt.print', ['sale' => $record->id]) . '"
                                           target="_blank"
                                           style="background-color:  #00B140"
                                           class="inline-flex items-center gap-2 px-4 py-2 bg-primary-600 hover:bg-primary-700 text-white text-sm font-medium rounded-lg shadow transition-colors duration-150">
                                            🖨️ Print Invoice
                                        </a>
                                    </div>
                                ';
                            })
                            ->columnSpanFull(),
                    ])
                    ->headerActions([])
                    ->extraAttributes([
                        'class' => 'border-0 shadow-none bg-transparent',
                    ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListSales::route('/'),
            'list' => Pages\CustomListSale::route('/custom-list'),
            'create' => Pages\CreateSale::route('/create'),
            'invoice' => Pages\SaleInvoice::route('/{record}/invoice'),
            // 'view' => Pages\ViewSale::route('/{record}'),
            //'edit' => Pages\EditSale::route('/{record}/edit'),
        ];
    }
}
