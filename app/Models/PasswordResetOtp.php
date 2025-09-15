<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;

class PasswordResetOtp extends Model
{
    protected $fillable = ['email', 'otp', 'expires_at'];

    protected $casts = [
        'expires_at' => 'datetime',
    ];

    public function isExpired(): bool
    {
        return $this->expires_at->isPast();
    }

    public static function generateOtp(string $email): string
    {
        // Clean up old OTPs for this email
        // static::where('email', $email)->delete();

        // Generate 6-digit OTP
        $otp = str_pad(random_int(0, 999999), 6, '0', STR_PAD_LEFT);

        // Create new OTP record
        // Add 10 minutes expired date from the current date
        static::updateOrCreate(
            ['email' => $email],
            [
                'otp' => $otp,
                'expires_at' => Carbon::now()->addMinutes(10),
            ]
        );
        return $otp;
    }

    public static function verifyOtp(string $email, string $otp): bool
    {
        $record = static::where('email', $email)
            ->where('otp', $otp)
            ->first();

        if (!$record || $record->isExpired()) {
            return false;
        }

        Log::info($record);

        // Clean up after successful verification
        $record->delete();
        return true;
    }
}
