<?php

namespace App\Filament\Resources\ProductResource\RelationManagers;

use App\Models\ProductImportItem;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Support\Enums\FontWeight;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ProductImportItemsRelationManager extends RelationManager
{
    protected static string $relationship = 'productImportItems';

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('id')
                    ->required()
                    ->maxLength(255),
            ]);
    }

    public function isReadOnly(): bool
    {
        return true;
    }

    public function table(Table $table): Table
    {
        return $table
            ->heading('Stock In History')
            ->recordTitleAttribute('id')
            ->defaultSort('productImport.import_date', 'desc')
            ->columns([
                Tables\Columns\TextColumn::make('productImport.import_date')
                    ->dateTooltip('d/M/Y')
                    ->sortable()
                    ->label('Stock In Date'),
                Tables\Columns\TextColumn::make('product_import_id')
                    ->toggleable(isToggledHiddenByDefault: false)
                    ->label('ID'),
                Tables\Columns\TextColumn::make('product.name')
                    ->toggleable(),
                Tables\Columns\TextColumn::make('qty')
                    ->sortable(),
                Tables\Columns\TextColumn::make('unit_price')
                    ->label('Purchase Price')
                    ->sortable()
                    ->money('usd'),
                Tables\Columns\TextColumn::make('total_price')
                    ->color('danger')
                    ->money(currency: 'usd')
                    ->getStateUsing(fn(ProductImportItem $record) => $record->subTotal())
                    ->weight(FontWeight::Bold),
                Tables\Columns\TextColumn::make('productImport.supplier.name'),
                Tables\Columns\TextColumn::make('productImport.user.name')
                    ->toggleable()
                    ->label('Stock By'),

                // Tables\Columns\TextColumn::make('qty'),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('productImport.supplier')
                    ->label('Supplier')
                    ->relationship('productImport.supplier', 'name')
                    ->preload()
                    ->searchable(),
                Tables\Filters\SelectFilter::make('productImport.user')
                    ->label('Stock By')
                    ->relationship('productImport.user', 'name')
                    ->preload()
                    ->searchable(),
            ])
            ->headerActions([
                // Tables\Actions\CreateAction::make(),
            ])
            ->actions([
                // Tables\Actions\ViewAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }
}
