<x-filament::page>
    <div class="space-y-6">
        <div>

            @if (!empty($this->formData['items']))
                {{-- <h2 class="text-xl font-bold mb-2">Checkout</h2> --}}
                <h2 class="text-xl font-bold mb-2"></h2>
            @endif

            <form wire:submit.prevent="checkout" class="space-y-4">
                {{ $this->form }}

                <div class="flex justify-between items-center border-t pt-4">
                    @if (!empty($this->formData['items']) /* && $this->formData['supplier_id'] */)
                        {{-- <span class="font-bold">
                            Total: ${{ number_format($this->getTotalAmount(), 2) }}
                        </span> --}}
                        <span></span>
                        <x-filament::button type="submit" color="success">
                            Stock In
                        </x-filament::button>
                    @endif
                </div>
            </form>
        </div>

        {{-- <div>
            {{ $this->table }}
        </div> --}}
    </div>
</x-filament::page>
