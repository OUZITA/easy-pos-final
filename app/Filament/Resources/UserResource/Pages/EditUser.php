<?php

namespace App\Filament\Resources\UserResource\Pages;

use App\Enums\Role;
use App\Filament\Resources\UserResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;
use Filament\Forms;
use Filament\Forms\Form;
use Illuminate\Support\Facades\Log;

class EditUser extends EditRecord
{
    protected static string $resource = UserResource::class;

    public static function canAccess(array $parameters = []): bool
    {
        $record = $parameters['record'] ?? null;
        if (!$record) {
            return false;
        }
        return !$record->isAdmin();
    }

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                    ->required(),
                Forms\Components\Select::make('role')
                    ->options(Role::class),
                Forms\Components\Toggle::make('active'),
            ]);
    }

    protected function mutateFormDataBeforeSave(array $data): array
    {
        Log::info($data);
        return $data;
    }
}
