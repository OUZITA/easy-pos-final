<x-filament-panels::page.simple>
    <x-filament-panels::form wire:submit="resetPassword">
        {{ $this->form }}

        <div class="flex flex-wrap items-center gap-4 justify-start">
            <x-filament::button type="submit" size="sm">
                {{ __('Reset Password') }}
            </x-filament::button>

            {{-- <x-filament::button
                color="gray"
                tag="a"
                :href="route('filament.admin.auth.login')"
                size="sm"
            >
                {{ __('Back to Login') }}
            </x-filament::button> --}}
        </div>
    </x-filament-panels::form>
</x-filament-panels::page.simple>
