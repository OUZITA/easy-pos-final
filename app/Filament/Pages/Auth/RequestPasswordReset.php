<?php

namespace App\Filament\Pages\Auth;

use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Pages\Auth\PasswordReset\RequestPasswordReset as BaseRequestPasswordReset;
use Filament\Http\Responses\Auth\Contracts\PasswordResetResponse;
use Illuminate\Support\Facades\Password;
use App\Models\PasswordResetOtp;
use App\Notifications\PasswordResetOtpNotification;
use Illuminate\Support\Facades\Notification;
use App\Models\User;
use Filament\Notifications\Notification as NotificationsNotification;

class RequestPasswordReset extends BaseRequestPasswordReset
{
    public function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('email')
                    ->label(__('filament-panels::pages/auth/password-reset/request-password-reset.form.email.label'))
                    ->email()
                    ->required()
                    ->autocomplete()
                    ->autofocus(),
            ]);
    }

    public function request(): void
    {
        $data = $this->form->getState();
        $email = $data['email'];

        // Check if user exists
        $user = User::where('email', $email)->first();
        if (!$user) {
            // $this->addError('email', __('We can\'t find a user with that email address.'));
            // return;
            throw \Illuminate\Validation\ValidationException::withMessages([
                'data.email' => __('We can\'t find a user with that email address.')
            ]);
        }

        // Generate OTP
        $otp = PasswordResetOtp::generateOtp($email);

        // Send OTP via notification
        Notification::route('mail', $email)
            ->notify(new PasswordResetOtpNotification($otp));

        NotificationsNotification::make()
            ->title(__('OTP sent successfully!'))
            ->success()
            ->body(__('We have sent a 6-digit verification code to your email address.'))
            ->send();

        // Redirect to OTP verification page
        redirect()->route('verify-otp', ['email' => $email]);
    }
}
