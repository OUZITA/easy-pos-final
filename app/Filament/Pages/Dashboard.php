<?php

namespace App\Filament\Pages;

use App\Filament\Resources\ProductImportResource\Widgets\ExpenseStats;
use App\Filament\Resources\ProductImportResource\Widgets\ProductImportChart;
use App\Filament\Resources\ProductResource\Widgets\LowStockProduct;
use App\Filament\Resources\SaleResource\Widgets\SaleActivityChart;
use App\Filament\Resources\SaleResource\Widgets\SaleBrandChart;
use App\Filament\Resources\SaleResource\Widgets\SaleChart;
use App\Filament\Resources\SaleResource\Widgets\SaleStats;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Section;
use Filament\Forms\Form;
use Illuminate\Support\HtmlString;
use Filament\Forms\Components\Placeholder;
use Filament\Actions\Action;
use Filament\Pages\Dashboard as BaseDashboard;

class Dashboard extends BaseDashboard
{
    use BaseDashboard\Concerns\HasFiltersForm;

    public function getWidgets(): array
    {
        return [
            SaleStats::class,
            ExpenseStats::class,
            LowStockProduct::class,
            // SaleActivityChart::class,
            // SaleChart::class,
            // ProductImportChart::class,
            // SaleBrandChart::class,
        ];
    }
}
