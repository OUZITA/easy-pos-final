<?php

namespace App\Filament\Pages\Auth;

use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Form;
use Filament\Pages\SimplePage;
use Filament\Actions\Action;
use Filament\Panel;
use App\Models\User;
use App\Models\PasswordResetOtp;
use DanHarrin\LivewireRateLimiting\Exceptions\TooManyRequestsException;
use DanHarrin\LivewireRateLimiting\WithRateLimiting;
use Filament\Notifications\Notification;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Route;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Support\Str;

class ResetPassword extends SimplePage
{
    use WithRateLimiting;

    protected static string $view = 'filament.pages.auth.reset-password';

    public static function registerRoutes(Panel $panel): void
    {
        Route::get('/reset-password', static::class)
            ->middleware(['web'])
            ->name('reset-password');
    }

    public static function registerNavigationItems(): array
    {
        return [];
    }

    public ?string $email = '';
    public array $data = [];

    public function mount(): void
    {
        $this->email = request('email', '');

        // Redirect if no email provided
        if (!$this->email) {
            redirect()->route('filament.admin.auth.password-reset.request');
            return;
        }
    }

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Hidden::make('email')
                    ->default($this->email),

                TextInput::make('password')
                    ->label(__('New Password'))
                    ->password()
                    ->revealable()
                    ->required()
                    ->minLength(8)
                    ->confirmed()
                    ->rules(['min:8'])
                    ->validationMessages([
                        'min' => 'Password must be at least 8 characters.',
                        'confirmed' => 'Password confirmation does not match.',
                    ]),

                TextInput::make('password_confirmation')
                    ->label(__('Confirm New Password'))
                    ->password()
                    ->revealable()
                    ->visible()
                    ->required()
                    ->dehydrated(false), // Don't include in form data
            ])
            ->statePath('data');
    }

    public function resetPassword(): void
    {
        try {
            // Rate limit: 3 attempts per minute
            $this->rateLimit(3, 60);

            $data = $this->form->getState();

            // Find the user
            $user = User::where('email', $this->email)->first();

            if (!$user) {
                Notification::make('user_not_found')
                    ->title('User not found')
                    ->danger()
                    ->send();
                return;
            }


            // Update the password
            $user->forceFill([
                'password' => Hash::make($data['password']),
                'remember_token' => Str::random(60),
            ])->save();

            // Clean up any remaining OTP records for this email (optional)
            // PasswordResetOtp::where('email', $this->email)->delete();

            // Fire password reset event
            event(new PasswordReset($user));

            // Log the password reset
            Log::info('Password reset completed', ['email' => $this->email]);

            // Show success notification
            Notification::make('success')
                ->title('Password updated successfully')
                ->body('You can now log in with your new password.')
                ->success()
                ->persistent()
                ->send();

            // Redirect to login page
            redirect()->route('filament.admin.auth.login');
        } catch (TooManyRequestsException $exception) {
            Notification::make('rate_limit')
                ->title('Too many attempts')
                ->body("Please try again in {$exception->secondsUntilAvailable} seconds.")
                ->danger()
                ->send();
        } catch (\Illuminate\Validation\ValidationException $e) {
            // ✅ Show validation error messages
            Notification::make('validation_error')
                ->title('Validation error')
                ->body(collect($e->validator->errors()->all())->join("\n"))
                ->danger()
                ->send();
        } catch (\Exception $e) {
            Log::error('Password reset error', [
                'email' => $this->email,
                'error' => $e->getMessage()
            ]);

            Notification::make('error')
                ->title('Something went wrong')
                ->body('Please try again or contact support.')
                ->danger()
                ->send();
        }
    }

    protected function getFormActions(): array
    {
        return [
            Action::make('reset')
                ->label(__('Reset Password'))
                ->submit('resetPassword'),

            Action::make('back')
                ->label(__('Back to Login'))
                ->color('gray')
                ->url(route('filament.admin.auth.login')),
        ];
    }

    public function getTitle(): string
    {
        return __('Reset Password');
    }

    public function getHeading(): string
    {
        return __('Reset your password');
    }

    // public function getSubheading(): string
    // {
    //     return __('Enter your new password for') . ' ' . $this->email;
    // }
}
