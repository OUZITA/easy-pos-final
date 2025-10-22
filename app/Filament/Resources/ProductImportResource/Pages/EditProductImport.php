<?php

namespace App\Filament\Resources\ProductImportResource\Pages;

use App\Filament\Resources\ProductImportResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;
use App\Models\Product;

class EditProductImport extends EditRecord
{
    protected static string $resource = ProductImportResource::class;


    protected $oldProductQtys = [];

    // protected function getHeaderActions(): array
    // {
    //     return [
    //         Actions\DeleteAction::make(),
    //     ];
    // }

    protected function beforeSave(): void
    {
        // Capture old quantities before the record and relations are updated
        $oldItems = $this->record->items()->get();
        foreach ($oldItems as $item) {
            $this->oldProductQtys[$item->product_id] =
                ($this->oldProductQtys[$item->product_id] ?? 0) + $item->qty;
        }

        // Force update the updated_at timestamp
        $this->record->updated_at = now();
    }

    protected function afterSave(): void
    {
        // Get new quantities after save
        $newProductQtys = [];
        $newItems = $this->record->items()->get();
        foreach ($newItems as $item) {
            $newProductQtys[$item->product_id] =
                ($newProductQtys[$item->product_id] ?? 0) + $item->qty;
        }

        // Adjust stock based on the difference
        $allProductIds = array_unique(array_merge(
            array_keys($this->oldProductQtys),
            array_keys($newProductQtys)
        ));

        foreach ($allProductIds as $productId) {
            $oldQty = $this->oldProductQtys[$productId] ?? 0;
            $newQty = $newProductQtys[$productId] ?? 0;
            $difference = $newQty - $oldQty;

            if ($difference !== 0) {
                $product = Product::find($productId);
                if ($product) {
                    $product->increment('stock', $difference);
                }
            }
        }
    }
}
