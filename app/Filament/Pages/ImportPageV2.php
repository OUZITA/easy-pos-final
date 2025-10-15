<?php


namespace App\Filament\Pages;

use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use App\Models\Sale;
use App\Models\SaleItem;
use App\Models\ProductImport;
use App\Models\ProductImportItem;
use Filament\Pages\Page;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Tables;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\TextInput;
use Filament\Tables\Columns\Layout\Stack;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\Layout\Columns;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Filament\Notifications\Notification;
use Awcodes\TableRepeater\Components\TableRepeater;
use Filament\Forms\Components\Placeholder;
use Awcodes\TableRepeater\Header;
use Filament\Support\Enums\Alignment;
use Filament\Support\Enums\FontWeight;
use Filament\Tables\Actions;
use Filament\Tables\Filters\Filter;


class ImportPageV2 extends Page implements Tables\Contracts\HasTable, Forms\Contracts\HasForms
{
    use Tables\Concerns\InteractsWithTable;
    use Forms\Concerns\InteractsWithForms;


    protected static string $view = 'filament.pages.import-pagev2';
    protected static ?string $slug = 'import-pagev2';
    protected static ?string $title = '';


    protected static bool $shouldRegisterNavigation = false;


    // formData used to store cart items and customer for sale
    public ?array $formData = [
        'items' => [],
        'supplier_id' => null,
    ];

    public function form(Form $form): Form
    {
        return $form
            ->schema([

                // --- Import Items ---
                TableRepeater::make('items')
                    ->headers([
                        Header::make('name')->label('Product Name')->width('30%'),
                        Header::make('qty')->label('Quantity')->width('100px')->align(Alignment::Left),
                        Header::make('stock')->label('Currently In Stock')->width('120px')->align(Alignment::Center),
                        Header::make('unit_price')->label('Price Per Unit')->width('150px')->align(Alignment::Center),
                        Header::make('product_price')->label('Current Selling Price')->width('140px')->align(Alignment::Center),
                        Header::make('Total_price')->label('Sub Total')->width('120px')->align(Alignment::Center),
                        Header::make('actions')->label('')->width('80px'),
                    ])
                    ->schema([
                        Hidden::make('product_id'),

                        Placeholder::make('name')
                            ->label(false)
                            ->inlineLabel()
                            ->extraAttributes(['class' => 'whitespace-nowrap'])
                            ->content(fn($get) => $get('name') ?? '-'),

                        TextInput::make('qty')
                            ->numeric()
                            ->minValue(1)
                            ->type('number')
                            ->extraAttributes([
                                'onkeydown' => "
            // Block e, E, +, -
            if(['e','E','+','-'].includes(event.key)) event.preventDefault();

            // Block 0 as first character
            if(event.key === '0' && event.target.value.length === 0) {
                event.preventDefault();
            }
        ",
                                'oninput' => "
            // Remove leading zeros
            if(this.value.length > 1) {
                this.value = this.value.replace(/^0+/, '');
                if(this.value === '') this.value = 1;
            }
            // Prevent going below 1
            if(parseInt(this.value) < 1 || this.value === '') {
                this.value = 1;
            }
        ",
                            ])
                            ->default(1)
                            ->lazy()
                            ->afterStateUpdated(function ($state, callable $set) {
                                $state = ltrim((string) $state, '0');
                                if ($state === '' || !is_numeric($state)) {
                                    $state = 1;
                                }
                                $state = (int) $state;

                                if ($state < 1) {
                                    $set('qty', 1);
                                    Notification::make()
                                        ->title('Quantity must be at least 1')
                                        ->danger()
                                        ->send();
                                } else {
                                    $set('qty', $state);
                                }

                                $this->updateTotals();
                            }),


                        Placeholder::make('stock')
                            ->label(false)
                            ->content(fn($get) => $get('stock') ?? 0),

                        TextInput::make('unit_price')
                            ->numeric()
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
                            ->minValue(0)
                            ->prefix('$')
                            ->required()
                            ->lazy() // smoother than live
                            ->afterStateUpdated(function ($state, callable $set) {
                                // Normalize
                                $state = ltrim((string) $state, '0');
                                if ($state === '' || !is_numeric($state)) {
                                    $state = 0;
                                }
                                $state = floor((float) $state * 100) / 100;

                                if ($state < 0) {
                                    $set('unit_price', 0);
                                    Notification::make()
                                        ->title('Unit price cannot be negative')
                                        ->danger()
                                        ->send();
                                } else {
                                    $set('unit_price', $state);
                                }
                            }),


                        Placeholder::make('product_price')
                            ->label(false)
                            ->dehydrated(false)
                            ->content(fn($get) => '$' . number_format($get('product_price') ?? 0, 2)),

                        Placeholder::make('Total_price')
                            ->extraAttributes(['class' => 'text-center'])
                            ->label(false)
                            ->content(
                                fn($get) =>
                                '$' . number_format(
                                    (int) ($get('qty') ?? 0) * ($get('unit_price') ?? 0),
                                    2
                                )
                            ),
                    ])
                    ->reorderable(false)
                    ->emptyLabel('No Product yet.')
                    ->addable(false),


                Forms\Components\Grid::make(5)
                    ->schema([
                        Placeholder::make('empty1')->label(false),
                        Placeholder::make('empty2')->label(false),
                        Placeholder::make('empty3')->label(false),
                        Placeholder::make('empty4')->label(false),
                        Placeholder::make('total_amount')
                            ->label('Total Amount')
                            ->content(fn($get) => '$' . number_format(
                                collect($get('items') ?? [])->sum(fn($item) => ($item['qty'] ?? 0) * ($item['unit_price'] ?? 0)),
                                2
                            ))
                            ->extraAttributes([
                                'class' => 'flex flex-col items-left font-bold',
                                'style' => 'width:350px;'
                            ]),
                    ]),
                Forms\Components\Select::make('supplier_id')
                    ->label('Select Supplier')
                    ->options(\App\Models\Supplier::where('active', true)->pluck('name', 'id'))
                    ->searchable()
                    ->required()
                    ->reactive()
                    ->placeholder('Select or create supplier')
                    ->createOptionForm([
                        Forms\Components\TextInput::make('name')->required(),
                        Forms\Components\TextInput::make('phone')->tel(),
                        Forms\Components\TextInput::make('address'),
                        Forms\Components\TextInput::make('bank_name'),
                        Forms\Components\TextInput::make('account_number'),
                        Forms\Components\Textarea::make('description')->columnSpanFull(),
                        Forms\Components\Toggle::make('active')->default(true)->required(),
                    ])
                    ->createOptionUsing(fn(array $data) => \App\Models\Supplier::create($data)->id),


                Forms\Components\Textarea::make('note')
                    ->label('Note')
                    ->nullable(),

                // Confirmation checkbox for high-priced imports
                Forms\Components\Checkbox::make('confirm_high_price')
                    ->label('I confirm that I want to import products at prices higher than their current selling prices')
                    ->visible(function () {
                        $items = $this->formData['items'] ?? [];
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
                    ->required(function () {
                        $items = $this->formData['items'] ?? [];
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
                    ->helperText(function () {
                        $highPriceProducts = [];
                        $items = $this->formData['items'] ?? [];
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


            ])
            ->statePath('formData')
            ->model(null)
            ->extraAttributes(['class' => 'space-y-4']);
    }

    public function updateTotals(): void
    {
        $items = $this->formData['items'] ?? [];


        foreach ($items as &$item) {
            $qty = (int) ($item['qty'] ?? 1);
            $unitPrice = (float) ($item['unit_price'] ?? 0);
            $product = \App\Models\Product::find($item['product_id']);

            // set current product price (live from DB)
            $item['product_price'] = $product?->price ?? 0;
            $subtotal = $qty * $unitPrice;
            $item['subtotal'] = $subtotal;
        }


        $this->formData['items'] = $items;
    }


    public function getTotalAmount(): float
    {
        $items = $this->formData['items'] ?? [];
        return collect($items)->sum('subtotal');
    }

    public function checkout(): void
    {
        $items = $this->formData['items'] ?? [];
        $supplierId = $this->formData['supplier_id'] ?? null;


        // Validate cart is not empty
        if (empty($items)) {
            Notification::make()
                ->title('Cart is empty!')
                ->body('Please add some items to your cart before checking out.')
                ->danger()
                ->send();
            return;
        }

        // Validate customer is selected
        if (!$supplierId) {
            Notification::make()
                ->title('Please select The Supplier!')
                ->body('A Supplier must be selected to complete the Import.')
                ->danger()
                ->send();
            return;
        }

        // Check for products where unit price is over current selling price
        $highPriceProducts = [];
        foreach ($items as $item) {
            if (isset($item['product_id']) && isset($item['unit_price'])) {
                $product = Product::find($item['product_id']);
                if ($product && $product->price > 0 && $item['unit_price'] > $product->price) {
                    $highPriceProducts[] = [
                        'name' => $product->name,
                        'current_price' => $product->price,
                        'import_price' => $item['unit_price'],
                    ];
                }
            }
        }

        // If there are high-priced products, require confirmation
        if (!empty($highPriceProducts)) {
            // Check if user has confirmed
            if (!isset($this->formData['confirm_high_price']) || $this->formData['confirm_high_price'] !== true) {
                $this->addError('confirm_high_price', 'Please confirm that you want to import products at prices higher than their current selling prices.');

                // Show notification with details
                $message = "The following products have import prices higher than their current selling prices:\n\n";
                foreach ($highPriceProducts as $product) {
                    $message .= "- {$product['name']}: Current $" . number_format($product['current_price'], 2) . " → Import $" . number_format($product['import_price'], 2) . "\n";
                }
                $message .= "\nPlease check the confirmation box to proceed.";

                Notification::make()
                    ->title('High Price Import Warning')
                    ->body($message)
                    ->warning()
                    ->persistent()
                    ->send();

                return; // Return without processing to show the form again
            }
        }

        try {
            DB::transaction(function () use ($items, $supplierId) {
                // Create the main sale record with proper customer_id
                $product_import = ProductImport::create([
                    'user_id' => Auth::id(),
                    'supplier_id' => $supplierId,
                    'import_date' => now(),
                    'note' => $this->formData['note'] ?? null,
                    // 'total_amount' => $this->getTotalAmount(),
                ]);


                // Create sale items
                foreach ($items as $item) {
                    // Validate stock availability
                    $product = Product::find($item['product_id']);
                    /* if (!$product || $product->stock < $item['qty']) {
                        throw new \Exception("Insufficient stock for {$item['name']}. Available: {$product->stock}, Required: {$item['qty']}");
                    }  */


                    ProductImportItem::create([
                        'product_import_id' => $product_import->id,
                        'product_id' => $item['product_id'],
                        'qty' => (int) $item['qty'],
                        'unit_price' => (float) $item['unit_price'],

                    ]);

                    // Update product stock
                    $product->increment('stock', $item['qty']);
                }
            });


            // Clear cart and customer selection after successful checkout
            $this->formData['items'] = [];
            $this->formData['supplier_id'] = null;
            $this->formData['confirm_high_price'] = false;


            Notification::make()
                ->title('Import completed successfully!')
                ->body('Import has been processed and inventory updated.')
                ->success()
                ->send();
        } catch (\Exception $e) {
            Log::error('Import failed: ' . $e->getMessage());


            Notification::make()
                ->title('Import failed')
                ->body($e->getMessage())
                ->danger()
                ->send();
        }
    }


    public function table(Table $table): Table
    {
        return $table
            ->heading('List of Product to Stock in')
            ->header(null)
            ->query(Product::query()->where('active', 1))
            ->defaultSort(function ($query) {
                return $query->orderByRaw('CASE WHEN stock <= stock_security THEN 0 ELSE 1 END ASC, stock ASC');
            })

            ->columns([
                ImageColumn::make('image')
                    ->height(50)
                    ->width(50)
                    ->defaultImageUrl(fn($record) => \App\Helpers\Util::getDefaultAvatar($record->name)),

                TextColumn::make('name')
                    ->searchable()
                    ->weight('bold')
                    ->size('md')
                    ->limit(50),

                TextColumn::make('price')
                    ->label('Selling Price')
                    ->formatStateUsing(fn($state) => '$' . number_format($state, 2))
                    ->color('success')
                    ->weight('bold')
                    ->size('md'),

                TextColumn::make('stock')
                    ->label('Current Stock')
                    ->sortable()
                    ->weight(FontWeight::Bold)
                    ->badge()
                    ->formatStateUsing(fn($state) => $state > 0 ? "In Stock: {$state}" : 'Out of Stock')
                    ->color(
                        fn($record) =>
                        $record->stock <= 0 ? 'danger' : ($record->stock <= $record->stock_security ? 'warning' : 'success')
                    )
                    ->icon(
                        fn($record) =>
                        $record->stock <= 0 ? 'heroicon-m-x-circle' : ($record->stock <= $record->stock_security ? 'heroicon-m-exclamation-triangle' : 'heroicon-m-check-circle')
                    )
                    ->tooltip(
                        fn($record) =>
                        $record->stock <= 0 ? 'Out of stock (security level: ' . $record->stock_security . ')' : ($record->stock <= $record->stock_security ? 'Low stock - below security level of ' . $record->stock_security : 'Stock level is good (above ' . $record->stock_security . ')')
                    ),
            ])
            ->actions([
                Tables\Actions\Action::make('addToCart')
                    ->label('Add to Stock in')
                    ->icon('heroicon-s-arrow-down-tray')
                    ->button()
                    ->color('primary')
                    ->visible(fn(Product $record) => !in_array($record->id, array_column($this->formData['items'] ?? [], 'product_id')))
                    ->form([
                        Forms\Components\Placeholder::make('current_stock')
                            ->label('Current Stock')
                            ->content(fn(Product $record) => $record->stock),
                        Forms\Components\Placeholder::make('current_price')
                            ->label('Current Selling Price')
                            ->content(fn(Product $record) => '$' . number_format($record->price, 2)),
                        Forms\Components\TextInput::make('qty')
                            ->label('Quantity to Stock In')
                            ->numeric()
                            ->minValue(1)
                            ->default(1)
                            ->required()
                            ->lazy()
                            ->extraAttributes([
                                'onkeydown' => "if(['e','E','+','-'].includes(event.key)) event.preventDefault();",
                                'oninput' => "if(this.value.length > 1) this.value = this.value.replace(/^0+/, ''); if(parseInt(this.value) < 1) this.value = 1;",
                            ])
                            ->afterStateUpdated(function ($state, callable $set) {
                                $state = ltrim((string) $state, '0');
                                if ($state === '' || !is_numeric($state)) {
                                    $state = 1;
                                }
                                $state = (int) $state;

                                if ($state < 1) {
                                    $set('qty', 1);
                                    Notification::make()
                                        ->title('Quantity must be at least 1')
                                        ->danger()
                                        ->send();
                                } else {
                                    $set('qty', $state);
                                }
                            }),
                        Forms\Components\TextInput::make('unit_price')
                            ->label('Unit Price')
                            ->numeric()
                            ->minValue(0)
                            ->prefix('$')
                            ->required()
                            ->lazy()
                            ->extraAttributes([
                                'onkeydown' => "if(['e','E','+','-'].includes(event.key)) event.preventDefault();",
                                'oninput' => "if(this.value.length > 1) this.value = this.value.replace(/^0+/, ''); if(parseFloat(this.value) < 0) this.value = 0;",
                            ])
                            ->afterStateUpdated(function ($state, callable $set) {
                                $state = ltrim((string) $state, '0');
                                if ($state === '' || !is_numeric($state)) {
                                    $state = 0;
                                }
                                $state = floor((float) $state * 100) / 100;

                                if ($state < 0) {
                                    $set('unit_price', 0);
                                    Notification::make()
                                        ->title('Unit price cannot be negative')
                                        ->danger()
                                        ->send();
                                } else {
                                    $set('unit_price', $state);
                                }
                            }),
                    ])
                    ->action(function (array $data, Product $record) {
                        $this->addToCart($record, $data);
                    }),
            ])
            ->filters([
                Filter::make('price')
                    ->form([
                        Forms\Components\TextInput::make('min_price')
                            ->numeric()
                            ->extraAttributes([
                                'onkeydown' => "if(['e','E','+','-'].includes(event.key)) event.preventDefault();",
                            ])
                            ->label('Min Price')
                            ->prefix('$'),
                        Forms\Components\TextInput::make('max_price')
                            ->numeric()
                            ->extraAttributes([
                                'onkeydown' => "if(['e','E','+','-'].includes(event.key)) event.preventDefault();",
                            ])
                            ->label('Max Price')
                            ->prefix('$'),
                    ])
                    ->query(function ($query, array $data) {
                        return $query
                            ->when(
                                $data['min_price'],
                                fn($q, $min) => $q->where('price', '>=', $min)
                            )
                            ->when(
                                $data['max_price'],
                                fn($q, $max) => $q->where('price', '<=', $max)
                            );
                    }),
                Filter::make('category_id')
                    ->form([
                        Forms\Components\Select::make('category_id')
                            ->label('Category')
                            ->options(\App\Models\Category::pluck('name', 'id'))
                            ->searchable()
                            ->placeholder('All Categories'),
                    ])
                    ->query(function ($query, array $data) {
                        return $query->when(
                            $data['category_id'],
                            fn($q, $categoryId) => $q->where('category_id', $categoryId)
                        );
                    }),

                // Brand filter
                Filter::make('brand_id')
                    ->form([
                        Forms\Components\Select::make('brand_id')
                            ->label('Brand')
                            ->options(\App\Models\Brand::pluck('name', 'id'))
                            ->searchable()
                            ->placeholder('All Brands'),
                    ])
                    ->query(function ($query, array $data) {
                        return $query->when(
                            $data['brand_id'],
                            fn($q, $brandId) => $q->where('brand_id', $brandId)
                        );
                    }),
            ])
            ->headerActions([
                Actions\Action::make('create_product_inline')
                    ->label('Add New Product')
                    ->icon('heroicon-o-plus')
                    ->form([
                        \Filament\Forms\Components\Section::make('Product Information')
                            ->schema([
                                \Filament\Forms\Components\Grid::make(2)
                                    ->schema([
                                        Forms\Components\TextInput::make('name')
                                            ->label('Product Name')
                                            ->required()
                                            ->maxLength(255)
                                            ->placeholder('Enter product name')
                                            ->unique(ignoreRecord: true),

                                        Forms\Components\TextInput::make('price')
                                            ->label('Price')
                                            ->required()
                                            ->numeric()
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
                                            ->required()
                                            ->relationship('category', 'name', fn($query) => $query->where('active', true))
                                            ->searchable()
                                            ->preload()
                                            ->exists(table: Category::class, column: 'id')
                                            ->createOptionForm([
                                                Forms\Components\TextInput::make('name')
                                                    ->unique()
                                                    ->required()
                                                    ->maxLength(255),
                                            ])
                                            ->placeholder('Select or create category'),

                                        Forms\Components\Select::make('brand_id')
                                            ->label('Brand')
                                            ->required()
                                            ->relationship('brand', 'name', fn($query) => $query->where('active', true))
                                            ->searchable()
                                            ->preload()
                                            ->exists(table: Brand::class, column: 'id')
                                            ->createOptionForm([
                                                Forms\Components\TextInput::make('name')
                                                    ->required()
                                                    ->unique()
                                                    ->maxLength(255),
                                            ])
                                            ->placeholder('Select or create brand'),

                                        Forms\Components\TextInput::make('stock_security')
                                            ->label('Low Stock Alert')
                                            ->required()
                                            ->numeric()
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
                                            ->minValue(1),
                                    ]),
                            ]),

                        Forms\Components\RichEditor::make('description')
                            ->label('Product Description')
                            ->placeholder('Describe your product in detail...')
                            ->columnSpanFull(),

                        Forms\Components\Section::make('Product Media')
                            ->description('Upload product images')
                            ->icon('heroicon-m-photo')
                            ->schema([
                                Forms\Components\FileUpload::make('image')
                                    ->label('Product Image')
                                    ->image()
                                    ->preserveFilenames()
                                    //->imagePreviewHeight('200')
                                    ->imageEditor()
                                    ->imageEditorAspectRatios([
                                        '16:9',
                                        '4:3',
                                        '1:1',
                                    ])
                                    ->acceptedFileTypes(['image/jpeg', 'image/png', 'image/webp'])
                                    ->directory('products')
                                    ->disk('public')
                                    ->visibility('public')
                                    ->maxSize(2048)

                            ]),

                        Forms\Components\Toggle::make('active')
                            ->default(true)
                            ->required(),
                    ])
                    ->modalWidth('6xl') // optional, make modal wider
                    ->action(function (array $data, \Filament\Tables\Actions\Action $action) {
                        \App\Models\Product::create($data);

                        $action->successNotification(
                            fn() => \Filament\Notifications\Notification::make()
                                ->title('Product created successfully!')
                                ->success()
                        );
                    })

            ])

            ->paginated([10, 25, 50])
            ->recordUrl(null);
    }


    public function addToCart(Product $product, array $data = null): void
    {
        $qty = $data['qty'] ?? 1;
        $unit_price = $data['unit_price'] ?? 0;
        $items = $this->formData['items'] ?? [];

        // Always add new item to cart, allowing multiple entries for the same product
        $items[] = [
            'product_id' => $product->id,
            'name' => $product->name,
            'stock' => $product->stock,
            'qty' => $qty,
            'unit_price' => $unit_price,
        ];

        $this->formData['items'] = $items;
        $this->updateTotals();

        Notification::make()
            ->title('Product added')
            ->seconds(2)
            ->body("{$product->name} has been added to import")
            ->success()
            ->send();
    }

    public function removeFromCart(int $index): void
    {
        $items = $this->formData['items'] ?? [];

        if (isset($items[$index])) {
            $productName = $items[$index]['name'] ?? 'Item';
            unset($items[$index]);
            $this->formData['items'] = array_values($items); // Re-index array
            $this->updateTotals();


            Notification::make()
                ->title('Item removed')
                ->body("{$productName} has been removed from your cart")
                ->success()
                ->send();
        }
    }
}
