<?php

namespace App\Filament\Pages\Auth;

use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Form;
use Filament\Pages\SimplePage;
use Filament\Actions\Action;
use Filament\Panel;
use App\Models\PasswordResetOtp;
use DanHarrin\LivewireRateLimiting\Exceptions\TooManyRequestsException;
use DanHarrin\LivewireRateLimiting\WithRateLimiting;
use Filament\Notifications\Notification;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\URL;

class VerifyOtp extends SimplePage
{
    use WithRateLimiting;
    protected static string $view = 'filament.pages.auth.verify-otp';

    public static function registerRoutes(Panel $panel): void
    {
        Route::get('/verify-otp', static::class)
            ->middleware(['web'])
            ->name('verify-otp');
    }

    public static function registerNavigationItems(): array
    {
        return [];
    }

    public ?string $email = '';
    // public ?string $otp = '';
    public array $data = []; // 👈 Add this

    public function mount(): void
    {
        $this->email = request('email', '');

        if (!$this->email) {
            redirect()->route('filament.admin.auth.password-reset.request');
        }
    }

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Hidden::make('email')
                    ->default($this->email),
                TextInput::make('otp')
                    ->label(__('Verification Code'))
                    ->placeholder('Enter 6-digit code')
                    // ->required()
                    // ->length(6)
                    ->numeric()
                    ->autofocus(),
            ])
            ->statePath('data');
    }

    public function verify(): void
    {
        try {
            // allow max 3 attempts per minute for this email
            $this->rateLimit(3, decaySeconds: 60);

            $data = $this->form->getState();

            // Manual validation
            if (empty($data['otp'])) {
                $this->addError('data.otp', 'Verification code is required.');
                return;
            }

            if (strlen($data['otp']) !== 6 || !is_numeric($data['otp'])) {
                $this->addError('data.otp', 'Please enter a valid 6-digit verification code.');
                return;
            }

            if (PasswordResetOtp::verifyOtp($this->email, $data['otp'])) {
                redirect()->route('reset-password', ['email' => $this->email]);
            } else {
                Notification::make('invalid')
                    ->title('Invalid verification code.')
                    ->danger()
                    ->seconds(3)
                    ->send();
            }
        } catch (TooManyRequestsException $exception) {
            Notification::make()
                ->title('Too many attempts')
                ->body("Please try again in {$exception->secondsUntilAvailable} seconds.")
                ->danger()
                ->send();
            // $this->addError('otp', __('Too many attempts. Please try again in :seconds seconds.', [
            //     'seconds' => $exception->secondsUntilAvailable,
            // ]));
        }
    }

    public function resendOtp(): void
    {
        if ($this->email) {
            $otp = PasswordResetOtp::generateOtp($this->email);

            // Send notification again
            \Illuminate\Support\Facades\Notification::route('mail', $this->email)
                ->notify(new \App\Notifications\PasswordResetOtpNotification($otp));
        }
    }

    protected function getFormActions(): array
    {
        return [
            Action::make('verify')
                ->label(__('Verify Code'))
                ->action('verify'),
            Action::make('resend')
                ->label(__('Resend Code'))
                ->color('gray')
                ->action('resendOtp'),
        ];
    }

    public function getTitle(): string
    {
        return __('Verify Your Email');
    }

    public function getHeading(): string
    {
        return __('Enter Verification Code');
    }

    public function getSubheading(): string
    {
        $data = $this->form->getState();
        return __('We sent a 6-digit code to');
    }
}
