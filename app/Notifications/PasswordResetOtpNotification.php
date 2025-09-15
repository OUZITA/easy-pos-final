<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\MailMessage;

class PasswordResetOtpNotification extends Notification
{
    use Queueable;

    public function __construct(private string $otp) {}

    public function via($notifiable): array
    {
        return ['mail'];
    }

    // public function toMail($notifiable): MailMessage
    // {
    //     return (new MailMessage)
    //         ->subject(subject: __('Password Reset Verification Code'))
    //         ->line(__('You are receiving this email because we received a password reset request for your account.'))
    //         ->line(__('Your verification code is:'))
    //         ->line('**' . $this->otp . '**')
    //         ->line(__('This code will expire in 10 minutes.'))
    //         ->line(__('If you did not request a password reset, no further action is required.'));
    // }
    public function toMail($notifiable): MailMessage
    {
        return (new MailMessage)
            ->subject(__('Password Reset - Verification Required'))
            ->greeting(__('Hello :name!', ['name' => $notifiable->name ?? 'there']))
            ->line(__('We received a request to reset the password for your account associated with this email address.'))
            ->line(__('To proceed with your password reset, please use the verification code below:'))
            ->line('')
            ->line('# ' . $this->otp)
            ->line('')
            ->line(__('**Important Security Information:**'))
            ->line(__('• This verification code will expire in **10 minutes**'))
            ->line(__('• Do not share this code with anyone'))
            ->line(__('• If you didn\'t request this password reset, please ignore this email'))
            ->line('')
            ->line(__('For your security, this code can only be used once. If you need a new code, please request another password reset.'))
            ->line('')
            ->salutation(__('Best regards,') . "\n" . config('app.name') . ' Security Team')
            ->line('')
            ->line('---')
            ->line(__('**Need Help?** Contact our support team if you have any questions.'))
            ->line(__('This is an automated message, please do not reply to this email.'));
    }
}
