<?php

namespace App\Filament\Pages\Auth;

use DanHarrin\LivewireRateLimiting\Exceptions\TooManyRequestsException;
use Filament\Facades\Filament;
use Filament\Forms\Form;
use Filament\Forms\Components\Tabs;
use Filament\Forms\Components\Tabs\Tab;
use Filament\Forms\Components\TextInput;
use Filament\Http\Responses\Auth\Contracts\LoginResponse;
use Filament\Models\Contracts\FilamentUser;
use Filament\Pages\Auth\Login as BaseLogin;
use Filament\Notifications\Notification;
use Illuminate\Support\Facades\Mail;

class Login extends BaseLogin
{
    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Tabs::make('Login Method')
                    ->contained(false)
                    ->tabs([
                        Tab::make('Password Login')
                            ->schema([
                                TextInput::make('email')
                                    ->label('Email Address')
                                    ->email()
                                    ->required()
                                    ->autocomplete('email')
                                    ->autofocus(),

                                TextInput::make('password')
                                    ->label('Password')
                                    ->password()
                                    ->required(),

                                \Filament\Forms\Components\Checkbox::make('remember')
                                    ->label('Remember me'),
                            ]),

                        Tab::make('Forgot Password?')
                            ->schema([
                                TextInput::make('email')
                                    ->label('Email Address')
                                    ->email()
                                    ->required()
                                    ->autocomplete('email'),

                                \Filament\Forms\Components\Placeholder::make('send_otp')
                                    ->label('')
                                    ->content(new \Illuminate\Support\HtmlString('<button type="button" wire:click="sendOtp" class="inline-flex items-center px-4 py-2 bg-primary-600 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-primary-700 focus:bg-primary-700 active:bg-primary-900 focus:outline-none focus:ring-2 focus:ring-primary-500 focus:ring-offset-2 transition ease-in-out duration-150">Send Login Code</button>')),

                                TextInput::make('otp_code')
                                    ->label('Login Code')
                                    ->numeric()
                                    ->length(6),
                            ]),
                    ]),
            ]);
    }


    public function sendOtp()
    {
        $data = $this->form->getState();

        $email = $data['email'];

        // Check if user exists
        $user = \App\Models\User::where('email', $email)->first();
        if (!$user) {
            Notification::make()
                ->title('User not found')
                ->body('No account found with this email address.')
                ->danger()
                ->send();
            return;
        }

        // Generate OTP
        $otp = rand(100000, 999999);

        // Store in user table
        $user->otp_code = $otp;
        $user->otp_expires_at = now()->addMinutes(10);
        $user->save();

        // Send email
        Mail::raw("Your Login code is: $otp", function ($message) use ($email) {
            $message->to($email)->subject('Your Password Login Code');
        });

        Notification::make()
            ->title('Login Code Sent')
            ->body('Check your email for the Login code.')
            ->success()
            ->send();
    }

    public function mount(): void
    {
        parent::mount();

        if (app()->environment('local')) {
            $this->form->fill([
                'email' => 'test@example.com',
                'password' => 'password',
                'remember' => true,
            ]);
        }
    }

    public function authenticate(): ?LoginResponse
    {
        try {
            $this->rateLimit(5);
        } catch (TooManyRequestsException $exception) {
            $this->getRateLimitedNotification($exception)?->send();

            return null;
        }

        $data = $this->form->getState();

        // Check if OTP login
        if (isset($data['otp_code'])) {
            return $this->authenticateWithOtp($data);
        }

        // Normal password login
        if (! Filament::auth()->attempt($this->getCredentialsFromFormData($data), $data['remember'] ?? false)) {
            $this->throwFailureValidationException();
        }

        $user = Filament::auth()->user();

        if (! $user->active) {
            Filament::auth()->logout();
            $this->throwFailureValidationException();
        }

        if (
            ($user instanceof FilamentUser) &&
            (! $user->canAccessPanel(Filament::getCurrentPanel()))
        ) {
            Filament::auth()->logout();

            $this->throwFailureValidationException();
        }

        session()->regenerate();

        return app(LoginResponse::class);
    }

    protected function authenticateWithOtp(array $data): ?LoginResponse
    {
        $email = $data['email'];
        $otpCode = $data['otp_code'] ?? null;

        if (!$otpCode) {
            $this->addError('otp_code', 'Reset Code is required.');
            return null;
        }

        $user = \App\Models\User::where('email', $email)->first();

        if (!$user) {
            $this->throwFailureValidationException();
            return null;
        }

        if ($user->otp_code !== (int) $otpCode || $user->otp_expires_at < now()) {
            $this->throwFailureValidationException();
            return null;
        }

        // Clear the OTP
        $user->otp_code = null;
        $user->otp_expires_at = null;
        $user->save();

        // Log the user in
        Filament::auth()->login($user);

        if (! $user->active) {
            Filament::auth()->logout();
            $this->throwFailureValidationException();
            return null;
        }

        if (
            ($user instanceof FilamentUser) &&
            (! $user->canAccessPanel(Filament::getCurrentPanel()))
        ) {
            Filament::auth()->logout();

            $this->throwFailureValidationException();
            return null;
        }

        session()->regenerate();

        return app(LoginResponse::class);
    }
}
