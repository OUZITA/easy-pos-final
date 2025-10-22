<?php

namespace App\Filament\Resources\ProductResource\Widgets;

use App\Filament\Resources\ProductResource\Pages\ListProducts;
use App\Models\Product;
use Filament\Widgets\Concerns\InteractsWithPageTable;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Illuminate\Support\Facades\DB;

class ProductStats extends BaseWidget
{
    use InteractsWithPageTable;

    protected static ?string $pollingInterval = null;

    protected function getTablePage(): string
    {
        return ListProducts::class;
    }

    protected function getStats(): array
    {
        return [

            Stat::make('Active Products Catalog size', $this->getPageTableQuery()->where('active', true)->count())
                ->color('success'),
            Stat::make('Total Product Stocks', $this->getPageTableQuery()->sum('stock')),
            Stat::make('Total Stocks Value', function (): string {
                $value = Product::select(DB::raw('SUM(stock * price) as total_value'))
                    ->value('total_value');

                return '$' . number_format($value ?? 0, 2); // format to 2 decimal places
            }),
            //Stat::make('Average Price', '$ ' . number_format($this->getPageTableQuery()->avg('price'), 2)),
        ];
    }
}
