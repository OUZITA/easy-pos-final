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
    protected static ?string $title = 'Create Stock in';

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        // Check for products where unit price is over current selling price
        $highPriceProducts = [];
        if (isset($data['items']) && is_array($data['items'])) {
            foreach ($data['items'] as $item) {
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
        }

        // If there are high-priced products, require confirmation
        if (!empty($highPriceProducts)) {
            // Check if user has confirmed
            if (!isset($data['confirm_high_price']) || $data['confirm_high_price'] !== true) {
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

                return $data; // Return without processing to show the form again
            }
        }

        // Remove confirmation field as it's not needed in the database
        unset($data['confirm_high_price']);

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

    /* protected function getFormActions(): array
    {
        return [
            CreateAction::make()
                ->label('Stock In')
                ->color('success'),
        ];
    } */

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
