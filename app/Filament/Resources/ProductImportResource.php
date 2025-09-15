<?php

namespace App\Filament\Resources;

use App\Filament\Exports\ProductImportExporter;
use App\Filament\Resources\ProductImportResource\Pages;
use App\Filament\Resources\ProductImportResource\RelationManagers;
use App\Models\Product;
use App\Models\ProductImport;
use App\Models\Supplier;
use Filament\Actions\Action;
use Filament\Actions\Exports\Enums\ExportFormat;
use Filament\Forms;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Placeholder;
use Filament\Forms\Form;
use Filament\Infolists\Components\Grid;
use Filament\Infolists\Components\RepeatableEntry;
use Filament\Infolists\Components\Split;
use Filament\Infolists\Components\TextEntry;
use Filament\Infolists\Infolist;
use Filament\Resources\Resource;
use Filament\Support\Enums\FontWeight;
use Filament\Tables;
use Filament\Tables\Actions\ExportBulkAction;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Log;

class ProductImportResource extends Resource
{
    protected static ?string $model = ProductImport::class;

    protected static ?string $navigationIcon = 'heroicon-m-arrow-down-tray';

    protected static ?string $navigationGroup = 'Inventory';

    protected static ?int $navigationSort = 1;
    public static function getNavigationLabel(): string
    {
        return 'Stock In'; // 👈 Change this to whatever you want
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Product Items')
                    ->schema([
                        Repeater::make('items')
                            ->relationship()
                            ->addActionLabel('Add More')
                            ->schema([
                                Forms\Components\Select::make('product_id')
                                    ->label('Product')
                                    ->relationship(
                                        name: 'product',
                                        titleAttribute: 'name',
                                        modifyQueryUsing: fn($query) => $query->where('active', true)->orderBy('stock')
                                    )
                                    ->getOptionLabelFromRecordUsing(
                                        fn($record) => '
        <div style="display: flex; align-items: center;">
            <img src="' . ($record->image
                                            ? \Illuminate\Support\Facades\Storage::url($record->image)
                                            : \App\Helpers\Util::getDefaultAvatar($record->name)
                                        ) . '" 
            style="width: 30px; height: 30px; margin-right: 10px; border-radius: 4px;" />
            <span>' . e($record->name) . ' | $' . number_format($record->price ?? 0, 2) . ' | Stock: ' . ($record->stock ?? 0) . '</span>
        </div>'
                                    )
                                    ->allowHtml()
                                    ->required()
                                    ->distinct()
                                    ->disableOptionsWhenSelectedInSiblingRepeaterItems()
                                    ->searchable()
                                    ->columnSpanFull()

                                    ->afterStateUpdated(
                                        fn($state, callable $set) =>
                                        $set('unit_price', \App\Models\Product::find($state)?->price ?? 0)
                                    ),


                                Forms\Components\TextInput::make('qty')
                                    ->label('Quantity')
                                    ->numeric()
                                    ->extraAttributes([
                                        'onkeydown' => "if(['e','E','+','-'].includes(event.key)) event.preventDefault();",
                                    ])
                                    ->default(1)
                                    ->minValue(1)
                                    ->required()
                                    ->lazy()
                                    ->afterStateUpdated(function ($state, callable $set) {
                                        $state = ltrim((string) $state, '0');
                                        if ($state === '' || !is_numeric($state)) {
                                            $state = 1;
                                        }
                                        $state = (int) $state;

                                        if ($state < 1) {
                                            $set('qty', 1);
                                            \Filament\Notifications\Notification::make()
                                                ->title('Quantity must be at least 1')
                                                ->danger()
                                                ->send();
                                        } else {
                                            $set('qty', $state);
                                        }
                                    }),

                                Placeholder::make('current_stock')
                                    ->label('Current Stock')
                                    ->content(fn($get) => Product::find($get('product_id'))?->stock ?? 0),

                                Forms\Components\TextInput::make('unit_price')
                                    ->label('Unit Price')
                                    ->numeric()
                                    ->minValue(0)
                                    ->prefix('$')
                                    ->required()
                                    ->lazy()
                                    ->extraAttributes([
                                        'onkeydown' => "
            // Block e, E, +, -
            if(['e','E','+','-'].includes(event.key)) event.preventDefault();

            // Prevent leading zero if field is empty
            if(event.key === '0' && event.target.value.length === 0) {
                event.preventDefault();
            }
        ",
                                        'oninput' => "
            // Remove leading zeros
            if(this.value.length > 1) {
                this.value = this.value.replace(/^0+/, '');
                if(this.value === '') this.value = 0;
            }
            // Enforce min 0
            if(parseFloat(this.value) < 0 || this.value === '') {
                this.value = 0;
            }
        ",
                                    ])
                                    ->afterStateUpdated(function ($state, callable $set) {
                                        $state = ltrim((string) $state, '0');
                                        if ($state === '' || !is_numeric($state)) {
                                            $state = 0;
                                        }
                                        $state = (float) $state;

                                        if ($state < 0) {
                                            $set('unit_price', 0);
                                            \Filament\Notifications\Notification::make()
                                                ->title('Unit price cannot be negative')
                                                ->danger()
                                                ->send();
                                        } else {
                                            $set('unit_price', $state);
                                        }
                                    }),

                                Placeholder::make('current_price')
                                    ->label('Current Selling Price')
                                    ->content(fn($get) => '$' . number_format(Product::find($get('product_id'))?->price ?? 0, 2)),

                                Placeholder::make('subtotal')
                                    ->label('Subtotal')
                                    ->content(fn($get) => '$' . number_format(($get('qty') ?? 0) * ($get('unit_price') ?? 0), 2)),
                            ])
                            ->orderColumn('')
                            ->defaultItems(1)
                            ->hiddenLabel()
                            ->columns(5)
                            ->required()
                    ]),
                Section::make()
                    ->schema([
                        Forms\Components\Select::make('supplier_id')
                            ->label('Supplier')
                            ->relationship('supplier', 'name', modifyQueryUsing: fn(Builder $query) => $query->where('active', true))
                            ->preload()
                            ->searchable()
                            ->columnSpanFull()
                            ->required()
                            ->createOptionForm([
                                Forms\Components\TextInput::make('name')
                                    ->required()
                                    ->unique(Supplier::class, 'name')
                                    ->maxLength(255),
                                Forms\Components\TextInput::make('phone')
                                    ->label('Phone')
                                    ->tel(),
                                Forms\Components\Textarea::make('address')
                                    ->label('Address'),
                                Forms\Components\TextInput::make('bank_name')
                                    ->label('Bank Account Name'),
                                Forms\Components\TextInput::make('account_number')
                                    ->label('Account Number'),
                                Forms\Components\Textarea::make('description')
                                    ->label('Description'),
                            ])
                            ->createOptionUsing(fn(array $data) => Supplier::create($data)->id),
                        Forms\Components\DatePicker::make('import_date')
                            ->label('Import Date')
                            ->displayFormat('d/m/Y')
                            // ->native(false)
                            ->default(now())
                            ->hidden()
                            ->required(),
                        Forms\Components\RichEditor::make('note')
                            ->columnSpan('full'),
                        // Confirmation checkbox for high-priced imports
                        Forms\Components\Checkbox::make('confirm_high_price')
                            ->label('I confirm that I want to import products at prices higher than their current selling prices')
                            ->visible(function ($get) {
                                $items = $get('items') ?? [];
                                foreach ($items as $item) {
                                    if (isset($item['product_id']) && isset($item['unit_price'])) {
                                        $product = Product::find($item['product_id']);
                                        if ($product && $product->price > 0 && $item['unit_price'] > $product->price) {
                                            return true;
                                        }
                                    }
                                }
                                return false;
                            })
                            ->required(function ($get) {
                                $items = $get('items') ?? [];
                                foreach ($items as $item) {
                                    if (isset($item['product_id']) && isset($item['unit_price'])) {
                                        $product = Product::find($item['product_id']);
                                        if ($product && $product->price > 0 && $item['unit_price'] > $product->price) {
                                            return true;
                                        }
                                    }
                                }
                                return false;
                            })
                            ->helperText(function ($get) {
                                $highPriceProducts = [];
                                $items = $get('items') ?? [];
                                foreach ($items as $item) {
                                    if (isset($item['product_id']) && isset($item['unit_price'])) {
                                        $product = Product::find($item['product_id']);
                                        if ($product && $product->price > 0 && $item['unit_price'] > $product->price) {
                                            $highPriceProducts[] = $product->name . ' (Current: $' . number_format($product->price, 2) . ' → Import: $' . number_format($item['unit_price'], 2) . ')';
                                        }
                                    }
                                }
                                if (!empty($highPriceProducts)) {
                                    return 'High-priced products: ' . implode(', ', $highPriceProducts);
                                }
                                return '';
                            }),
                    ])->columns(2),

            ]);
    }

    public static function infolist(Infolist $infolist): Infolist
    {
        return $infolist
            ->schema([
                \Filament\Infolists\Components\Section::make('Product Import Information')
                    ->schema([
                        Grid::make(3)
                            ->schema([
                                TextEntry::make('id')
                                    ->label('Import ID')
                                    ->badge()
                                    ->color('primary'),

                                TextEntry::make('import_date')
                                    ->label('Import Date')
                                    ->date('d/m/Y')
                                    ->icon('heroicon-o-calendar-days'),

                                TextEntry::make('created_at')
                                    ->label('Created')
                                    ->since()
                                    ->icon('heroicon-o-clock'),
                            ]),

                        Grid::make(3)
                            ->schema([
                                TextEntry::make('supplier.name')
                                    ->label('Supplier')
                                    ->icon('heroicon-o-building-office-2')
                                    ->weight(FontWeight::SemiBold),

                                TextEntry::make('user.name')
                                    ->label('Created by')
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
                    ->schema([
                        RepeatableEntry::make('items')
                            ->schema([
                                Split::make([
                                    Grid::make(6)
                                        ->schema([
                                            TextEntry::make('product.name')
                                                ->label('Product')
                                                ->weight(FontWeight::SemiBold),
                                            //->icon('heroicon-o-cube'),

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
                                                ->money('USD')
                                                ->icon('heroicon-o-currency-dollar'),

                                            TextEntry::make('sub_total')
                                                ->label('Sub Total')
                                                ->money('USD')
                                                ->weight(FontWeight::Bold)
                                                ->color('success')
                                                ->state(function ($record) {
                                                    return $record->qty * $record->unit_price;
                                                }),
                                        ]),
                                ])
                            ])
                            ->contained(false)
                            ->hiddenLabel(),

                        Grid::make(5)
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
                                    ->color('success')
                                    ->icon('heroicon-o-currency-dollar'),
                            ])
                    ]),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('id')
                    ->label('ID')
                    ->toggleable(),
                Tables\Columns\TextColumn::make('products')
                    ->label('Products')
                    ->wrap()
                    ->getStateUsing(function (ProductImport $record) {
                        // Option 1: Simple approach (may cause N+1 queries)
                        return $record->listProducts();
                    }),
                Tables\Columns\TextColumn::make('total_qty')
                    ->label('Total Qty')
                    ->sortable(query: function (Builder $query, string $direction): Builder {
                        $result =  $query
                            ->select('product_imports.*')
                            ->selectRaw('(SELECT SUM(qty) 
              FROM product_import_items 
              WHERE product_import_items.product_import_id = product_imports.id) as total_qty')
                            ->orderBy('total_qty', $direction);

                        Log::info($result->get());
                        return $result;
                    })
                    ->weight(FontWeight::Bold)
                    ->getStateUsing(function (ProductImport $record) {
                        // Option 1: Simple approach (may cause N+1 queries)
                        return $record->totalQty();
                    }),

                Tables\Columns\TextColumn::make('total_price')
                    ->label('Total Price')
                    ->color('danger')
                    ->money(currency: 'usd')
                    ->getStateUsing(fn(ProductImport $record) => $record->totalPrice())
                    ->sortable(query: fn(Builder $query, string $direction) => ProductImport::sortByTotalPrice($query, $direction))
                    ->weight(FontWeight::Bold),

                Tables\Columns\TextColumn::make('import_date')
                    ->label('Stock in Date')
                    ->date('d/m/Y')
                    ->dateTooltip('d/M/Y')
                    ->sortable(),


                Tables\Columns\TextColumn::make('supplier.name')
                    ->url(fn($record) => SupplierResource::getUrl('supplier.view', ['record' => $record->supplier_id]), true)
                    ->tooltip("link to view supplier's information")
                    ->sortable(),
                Tables\Columns\TextColumn::make('note')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->html(),

                Tables\Columns\TextColumn::make('user.name')
                    ->toggleable()
                    ->label('Stock in By'),
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
                Filter::make('import_date')
                    ->form([
                        DatePicker::make('import_from')
                            ->label('Stock in From'),
                        DatePicker::make('import_util')
                            ->label('Stock in Until'),
                    ])
                    ->query(function (Builder $query, array $data): Builder {
                        return $query
                            ->when(
                                $data['import_from'],
                                callback: fn(Builder $query, $date): Builder => $query->whereDate('import_date', '>=', $date),
                            )
                            ->when(
                                $data['import_util'],
                                fn(Builder $query, $date): Builder => $query->whereDate('import_date', '<=', $date),
                            );
                    }),
                /* Tables\Filters\Filter::make('date_range')
                    ->form([
                        Forms\Components\DatePicker::make('from_date'),
                        Forms\Components\DatePicker::make('to_date'),
                    ])
                    ->query(function ($query, array $data) {
                        return $query
                            ->when($data['from_date'], fn($q) => $q->whereDate('import_date', '>=', $data['from_date']))
                            ->when($data['to_date'], fn($q) => $q->whereDate('import_date', '<=', $data['to_date']));
                    }), */
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

                Tables\Filters\SelectFilter::make('supplier')
                    ->relationship('supplier', 'name')
                    ->preload()
                    ->searchable()
                    ->multiple(),
                Tables\Filters\SelectFilter::make('importer')
                    ->relationship('user', 'name')
                    ->preload()
                    ->searchable()
                    ->multiple(),

            ])
            ->searchable()
            ->actions([
                Tables\Actions\ViewAction::make(),
                // Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make()
                    ->before(function (ProductImport $record) {
                        foreach ($record->items as $item) {
                            $product = $item->product;
                            $product->decrement('stock', $item->qty);
                        }
                    })
            ])
            ->bulkActions(
                actions: [
                    ExportBulkAction::make()
                        ->color('primary')
                        ->exporter(ProductImportExporter::class)
                    /* ->formats([
                            ExportFormat::Xlsx,
                        ]) */
                ]
            )
            ->defaultSort('created_at', 'desc');
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
            'index' => Pages\ListProductImports::route('/'),
            'create' => Pages\CreateProductImport::route('/create'),
            // 'edit' => Pages\EditProductImport::route('/{record}/edit'),
        ];
    }
}
