<?php

namespace App\Filament\Resources\ProductResource\Pages;

use App\Enums\Role;
use App\Filament\Resources\ProductResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Support\Facades\Auth;

class EditProduct extends EditRecord
{
    protected static string $resource = ProductResource::class;

    public function mount(int|string $record): void
    {
        if (Auth::user()?->role === Role::Cashier) {
            abort(403, 'Access denied');
        }

        parent::mount($record);
    }
}
