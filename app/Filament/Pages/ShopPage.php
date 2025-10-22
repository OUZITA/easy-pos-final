<?php


namespace App\Filament\Pages;

use App\Enums\Gender;
use App\Models\Product;
use App\Models\Sale;
use App\Models\SaleItem;
use Awcodes\TableRepeater\Components\TableRepeater;
use Awcodes\TableRepeater\Header;
use Filament\Pages\Page;
use Filament\Forms;
use Filament\Tables;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\Placeholder;
use Filament\Forms\Components\TextInput;
use Filament\Tables\Columns\Layout\Stack;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\Layout\Columns;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;
use Filament\Notifications\Notification;
use Filament\Support\Enums\Alignment;
use Filament\Tables\Filters\Filter;
use Filament\Forms\Components\Wizard;
use Filament\Forms\Components\Wizard\Step;
use App\Filament\Resources\SaleResource;
use Filament\Forms\Components\Grid;


class ShopPage extends Page implements Tables\Contracts\HasTable, Forms\Contracts\HasForms
{
    use Tables\Concerns\InteractsWithTable;
    use Forms\Concerns\InteractsWithForms;


    protected static string $view = 'filament.pages.shop-page';
    protected static ?string $title = '';

    protected static bool $shouldRegisterNavigation = false;
    /* public ?Sale $sale = null;

    public function mount(): void
    {
        $this->sale = new Sale(); // fresh Sale instance
    } */


    // formData used to store cart items and customer for sale
    public ?array $formData = [
        'items' => [],
        'customer_id' => null,
        'currency' => 'usd',
    ];

    public function form(Forms\Form $form): Forms\Form
    {
        return $form
            ->model(Sale::class)
            ->schema([
                Wizard::make([
                    // Step 1: Add products to cart
                    Step::make('Cart Items')
                        ->schema([
                            TableRepeater::make('items')
                                ->headers([
                                    Header::make('name')->label('Product Name')->width('30%'),
                                    Header::make('qty')->label('Qty')->width('150px')->align(Alignment::Left),
                                    Header::make('stock')->label('In Stock')->width('100px')->align(Alignment::Center),
                                    Header::make('unit_price')->label('Unit Price')->width('120px')->align(Alignment::Center),
                                    Header::make('discount')->label('Discount')->width('120px')->align(Alignment::Center),
                                    Header::make('subtotal')->label('Sub Total')->width('120px')->align(Alignment::Center),
                                    Header::make('actions')->label('')->width('80px'),
                                ])
                                ->schema([
                                    Hidden::make('product_id')->default(null),
                                    Placeholder::make('name')
                                        ->label(false)
                                        ->inlineLabel()
                                        ->content(fn($get) => $get('name') ?? '-'),
                                    TextInput::make('qty')
                                        ->numeric()
                                        ->extraAttributes([
                                            'onkeydown' => "
            // Block e, E, +, -
            if(['e','E','+','-'].includes(event.key)) event.preventDefault();

            // Block 0 as the first character
            if(event.key === '0' && event.target.value.length === 0) {
                event.preventDefault();
            }
        ",
                                            // Extra: clean up pasted values or spinner changes
                                            'oninput' => "
            if(this.value.length > 1) {
                this.value = this.value.replace(/^0+/, ''); // remove leading zeros
            }
            if(this.value === '' || parseInt(this.value) < 1) {
                this.value = 1; // fallback
            }
        ",
                                        ])
                                        ->default(1)
                                        ->minValue(1)
                                        ->maxValue(fn($get) => (int) ($get('stock') ?? 1))
                                        ->step(1)
                                        ->lazy()
                                        //->live(onBlur: false)
                                        ->afterStateUpdated(function ($state, callable $set, $get) {
                                            $stock = (int) ($get('stock') ?? 1);

                                            if (!is_numeric($state) || $state < 1) {
                                                $state = 1;
                                                Notification::make()
                                                    ->title('Quantity too low')
                                                    ->body('Quantity cannot be less than 1.')
                                                    ->warning()
                                                    ->send();
                                            } elseif ($state > $stock) {
                                                $state = $stock;
                                                Notification::make()
                                                    ->title('Insufficient stock')
                                                    ->body("Only {$stock} units available for this product.")
                                                    ->warning()
                                                    ->send();
                                            }
                                            $set('qty', (int) $state);

                                            $this->updateTotals();
                                        }),
                                    Placeholder::make('stock')
                                        ->label(false)
                                        ->content(fn($get) => $get('stock') ?? 0),
                                    Placeholder::make('unit_price')
                                        ->label(false)
                                        ->content(fn($get) => '$' . number_format((float) ($get('unit_price') ?? 0), 2)),
                                    TextInput::make('discount')
                                        ->numeric()
                                        ->default(0)
                                        ->minValue(0)
                                        ->maxValue(100)
                                        ->step(1)
                                        ->required()
                                        ->suffix('%')
                                        ->extraAttributes([
                                            'onkeydown' => "
            // Block e, E, +, -
            if(['e','E','+','-'].includes(event.key)) event.preventDefault();

            // Prevent '00', '01', etc. but allow a single '0'
            if(event.key === '0' && event.target.value === '0') {
                event.preventDefault();
            }
        ",
                                            'oninput' => "
            // Remove leading zeros but allow single '0'
            if(this.value.length > 1) {
                this.value = this.value.replace(/^0+/, '');
                if(this.value === '') this.value = 0;
            }
            // Enforce min 0
            if(parseInt(this.value) < 0 || this.value === '') {
                this.value = 0;
            }
            // Enforce max 100
            if(parseInt(this.value) > 100) {
                this.value = 100;
            }
        ",
                                        ])
                                        ->lazy()
                                        ->afterStateUpdated(function ($state, callable $set) {
                                            if ($state === null || $state === '' || $state < 0) {
                                                $set('discount', 0);
                                            } elseif ($state > 100) {
                                                $set('discount', 100);
                                            } else {
                                                $set('discount', (int) $state);
                                            }

                                            $this->updateTotals();
                                        }),



                                    Placeholder::make('subtotal')
                                        ->extraAttributes(['class' => 'text-center'])
                                        ->label(false)
                                        ->content(fn($get) =>
                                        '$' . number_format(
                                            ($get('qty') ?? 0) * ($get('unit_price') ?? 0) * (1 - ($get('discount') ?? 0) / 100),
                                            2
                                        )),

                                ])
                                ->emptyLabel('No Product yet.')
                                ->deletable(true)
                                ->addable(false)
                                ->reorderable(false)
                                ->streamlined(),
                            Forms\Components\Grid::make(5)
                                ->schema([
                                    Placeholder::make('empty1')->label(false),
                                    Placeholder::make('empty2')->label(false),
                                    Placeholder::make('empty3')->label(false),
                                    Placeholder::make('empty4')->label(false),
                                    Placeholder::make('total_amount')
                                        ->label('Total Amount')
                                        ->content(fn($get) => '$' . number_format(
                                            collect($get('items') ?? [])->sum(
                                                fn($item) => ($item['qty'] ?? 0) * ($item['unit_price'] ?? 0) * (1 - (($item['discount'] ?? 0) / 100))
                                            ),
                                            2
                                        ))
                                        ->extraAttributes([
                                            'class' => 'flex flex-col items-left font-bold',
                                            'style' => 'width:350px;'
                                        ]),

                                ]),
                        ]),

                    // Step 2: Select customer and checkout
                    Step::make('Customer & Checkout')
                        ->schema([
                            Grid::make(1)
                                ->schema([
                                    Forms\Components\Select::make('customer_id')
                                        ->label('Select Customer')
                                        ->options(\App\Models\Customer::where('active', true)->pluck('name', 'id'))
                                        ->searchable()
                                        ->required()
                                        ->reactive()
                                        ->visible(fn($get) => !empty($get('items')))
                                        ->createOptionForm([
                                            Forms\Components\TextInput::make('name')
                                                ->required()
                                                ->maxLength(255),
                                            Forms\Components\TextInput::make('phone')
                                                ->maxLength(255),
                                            Forms\Components\Select::make('gender')
                                                ->enum(Gender::class)
                                                ->prefixIcon('heroicon-m-user-circle')
                                                ->options(Gender::class),
                                            Forms\Components\TextInput::make('address')
                                                ->label('Address')
                                                ->maxLength(255),
                                        ])
                                        ->createOptionUsing(function (array $data) {
                                            return \App\Models\Customer::create($data)->id;
                                        }),
                                ]),
                            Grid::make(3)
                                ->schema([
                                    Placeholder::make('total')
                                        ->label('Total Amount')
                                        ->content(fn() => '$' . number_format($this->getTotalAmount(), 2)),

                                    TextInput::make('total_pay')
                                        ->numeric()
                                        ->label('Payment')
                                        ->extraAttributes([
                                            'onkeydown' => "
                            if(['e','E','+','-'].includes(event.key)) event.preventDefault();
                            if(event.key === '0' && event.target.value.length === 0) {
                                event.preventDefault();
                            }
                            ",
                                            'oninput' => "
                            if(this.value.length > 1) {
                                this.value = this.value.replace(/^0+/, '');
                                if(this.value === '') this.value = 0;
                            }
                            if(parseFloat(this.value) < 0 || this.value === '') {
                                this.value = 0;
                            }
                            ",
                                        ])
                                        ->minValue(0)
                                        ->step(0.01)
                                        ->prefix('$')
                                        ->required()
                                        ->lazy()
                                        ->live(onBlur: true)
                                        ->afterStateUpdated(function ($state, callable $set, callable $get) {
                                            // Clean input first
                                            $state = ltrim((string) $state, '0');
                                            if ($state === '' || !is_numeric($state)) {
                                                $state = 0;
                                            }
                                            $state = round((float) $state, 2);

                                            // Calculate required total
                                            $total = $this->getTotalAmount();

                                            // Define max allowed
                                            $maxAllowed = $total + 100;

                                            // Validate lower bound
                                            if ($state < $total) {
                                                Notification::make()
                                                    ->title('Insufficient Payment')
                                                    ->body('Payment must be at least equal to the total amount.')
                                                    ->warning()
                                                    ->send();

                                                $state = $total;
                                            }

                                            // Validate upper bound
                                            if ($state > $maxAllowed) {
                                                Notification::make()
                                                    ->title('Excess Payment')
                                                    ->body('Payment cannot exceed the total amount by more than $100.')
                                                    ->warning()
                                                    ->send();

                                                $state = $maxAllowed;
                                            }

                                            $set('total_pay', $state);
                                        }),



                                    Placeholder::make('change')
                                        ->label('Changes')
                                        ->content(function ($get) {
                                            $total = $this->getTotalAmount();
                                            $pay = $get('total_pay') ?? 0;

                                            $symbol = '$';
                                            $decimals = 2;

                                            $change = max(0, $pay - $total);

                                            return $symbol . number_format($change, $decimals);
                                        }),

                                ])

                        ])
                ])
                    ->nextAction(function (Forms\Components\Actions\Action $action) {
                        return $action
                            ->label('Next')
                            ->disabled(fn($get) => blank($get('items')));
                    })
            ])
            ->statePath('formData')
            // ->model(null)
        ;
    }


    public function updateTotals(): void
    {
        $items = $this->formData['items'] ?? [];


        foreach ($items as &$item) {
            $qty = (int) ($item['qty'] ?? 1);
            $unitPrice = (float) ($item['unit_price'] ?? 0);
            $discount = (int) ($item['discount'] ?? 0);


            $subtotal = $qty * $unitPrice;
            $discountAmount = $subtotal * ($discount / 100);
            $item['subtotal'] = $subtotal - $discountAmount;
        }


        $this->formData['items'] = $items;
    }


    public function getTotalAmount(): float
    {
        $items = $this->formData['items'] ?? [];
        return collect($items)->sum('subtotal');
    }


    public function checkout()
    {
        $items = $this->formData['items'] ?? [];
        $customerId = $this->formData['customer_id'] ?? null;


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
        if (!$customerId) {
            Notification::make()
                ->title('Please select a customer!')
                ->body('A customer must be selected to complete the sale.')
                ->danger()
                ->send();
            return;
        }

        // Validate payment amount is provided and sufficient
        $paymentAmount = $this->formData['total_pay'] ?? 0;
        // $currency = $this->formData['currency'] ?? 'usd';
        $totalAmount = $this->getTotalAmount();

        // Convert total to selected currency for validation
        $requiredAmount = $totalAmount;
        // if ($currency === 'khr') {
        //     $requiredAmount *= 4000;
        // }

        if ($paymentAmount <= 0) {
            Notification::make()
                ->title('Payment Required!')
                ->body('Please enter a payment amount to complete the sale.')
                ->danger()
                ->send();
            return;
        }

        if ($paymentAmount < $requiredAmount) {
            Notification::make()
                ->title('Insufficient Payment!')
                ->body(
                    // $currency === 'usd'
                    "Payment of $" . number_format($paymentAmount, 2) . " is less than the required $" . number_format($requiredAmount, 2) . "."
                    // : "Payment of ៛" . number_format($paymentAmount, 0) . " is less than the required ៛" . number_format($requiredAmount, 0) . "."
                )
                ->danger()
                ->send();
            return;
        }


        try {
            $sale = null;
            DB::transaction(function () use ($items, $customerId) {
                // Convert payment to USD before saving to database
                $paymentAmount = $this->formData['total_pay'] ?? 0;
                // $currency = $this->formData['currency'] ?? 'usd';

                // if ($currency === 'khr') {
                //     $paymentAmount = $paymentAmount / 4000; // Convert Riel to USD
                // }

                // Create the main sale record with proper customer_id
                $sale = Sale::create([
                    'user_id' => auth()->id(),
                    'customer_id' => $customerId,
                    'sale_date' => now(),
                    'total_pay' => round($paymentAmount, 2), // Always store in USD
                    // 'total_amount' => $this->getTotalAmount(),
                ]);


                // Create sale items
                foreach ($items as $item) {
                    // Validate stock availability
                    $product = Product::find($item['product_id']);
                    if (!$product || $product->stock < $item['qty']) {
                        throw new \Exception("Insufficient stock for {$item['name']}. Available: {$product->stock}, Required: {$item['qty']}");
                    }


                    SaleItem::create([
                        'sale_id' => $sale->id,
                        'product_id' => $item['product_id'],
                        'qty' => (int) $item['qty'],
                        'unit_price' => (float) $item['unit_price'],
                        'discount' => (int) ($item['discount'] ?? 0),
                    ]);


                    // Update product stock
                    $product->decrement('stock', $item['qty']);
                }
            });



            // Clear cart and customer selection after successful checkout
            $this->formData['items'] = [];
            $this->formData['customer_id'] = null;
            // $this->formData['currency'] = 'usd';


            Notification::make()
                ->title('Sale completed successfully!')
                ->body('Sale has been processed and inventory updated.')
                ->success()
                ->send();

            return redirect()->to(SaleResource::getUrl('index'));
        } catch (\Exception $e) {
            Log::error('Sale failed: ' . $e->getMessage());


            Notification::make()
                ->title('Sale failed')
                ->body($e->getMessage())
                ->danger()
                ->send();
        }
    }

    public function table(Table $table): Table
    {
        return $table
            ->header(null)
            ->query(Product::query()->where('active', 1)->where('stock', '>', 0))
            ->defaultSort('stock', 'desc')
            ->columns([
                Stack::make([
                    ImageColumn::make('image')
                        ->height(100)
                        ->defaultImageUrl(fn($record) => \App\Helpers\Util::getDefaultAvatar($record->name)),

                    TextColumn::make('name')
                        ->searchable()
                        ->weight('Normal')
                        ->size('md')
                        ->limit(30)
                        ->extraAttributes(['class' => 'whitespace-normal']),

                    /* TextColumn::make('description')
                        ->label('Description')
                        ->limit(100)
                        ->wrap()
                        ->extraAttributes([
                            'style' => 'min-height:50px; display:block; overflow:hidden;'
                        ])
                        ->formatStateUsing(fn($state) => strip_tags($state)), */

                    /* TextColumn::make('brand.name')
                        ->badge()
                        ->color('info')
                        ->weight('normal'),

                    TextColumn::make('category.name')
                        ->badge()
                        ->color('info')
                        ->weight('normal'), */

                    TextColumn::make('price')
                        ->formatStateUsing(fn($state) => '$' . number_format($state, 2))
                        ->color('success')
                        ->weight('bold')
                        ->size('md'),

                    TextColumn::make('stock')
                        ->badge()
                        ->color(fn($state) => $state > 0 ? 'success' : 'danger')
                        ->formatStateUsing(fn($state) => $state > 0 ? "In Stock: {$state}" : 'Out of Stock')
                        ->weight('normal'),

                    // Add-to-sale button inside the stack
                    TextColumn::make('actions')
                        ->label('')
                        ->formatStateUsing(fn($record) => view('components.add-to-cart-button', ['record' => $record]))
                        ->html()


                ])
            ])

            ->actions([
                Tables\Actions\Action::make('addToCart')
                    ->label('Add to Sale')
                    ->icon('heroicon-o-shopping-cart')
                    ->button()
                    ->color('primary')
                    ->action(fn(Product $record) => $this->addToCart($record))
                    ->hidden(fn(Product $record) => collect($this->formData['items'] ?? [])
                        ->pluck('product_id')
                        ->contains($record->id)),
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
            ->contentGrid([
                'sm' => 1,
                'md' => 1,
                'lg' => 1,
                'xl' => 3,
            ])
            ->paginated([6])
            ->recordUrl(null);
    }


    public function addToCart(Product $product): void
    {
        $items = $this->formData['items'] ?? [];
        Log::info('Adding to cart:', $this->formData);


        // Check if product already exists in cart
        $existingIndex = collect($items)->search(fn($item) => $item['product_id'] === $product->id);


        if ($existingIndex !== false) {
            // Check stock before increasing quantity
            $newQty = ($items[$existingIndex]['qty'] ?? 1) + 1;
            if ($newQty > $product->stock) {
                Notification::make()
                    ->title('Insufficient stock!')
                    ->body("Only {$product->stock} units available for {$product->name}")
                    ->warning()
                    ->send();
                return;
            }


            $items[$existingIndex]['qty'] = $newQty;
        } else {
            // Add new item to cart
            $items[] = [
                'product_id' => $product->id,
                'name' => $product->name,
                'stock' => $product->stock,
                'qty' => 1,
                'unit_price' => $product->price,
                'discount' => 0,
                'subtotal' => $product->price,
            ];
        }

        $this->formData['items'] = $items;
        $this->updateTotals();

        Notification::make()
            ->title('Product added')
            ->seconds(2)
            ->body("{$product->name} has been added to sale")
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
