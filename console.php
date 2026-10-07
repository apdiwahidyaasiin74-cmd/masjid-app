<?php

use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\Artisan;

Artisan::command('inspire', function () {
    $this->comment(Inspiring::quote());
})->purpose('Display an inspiring quote');

use Illuminate\Support\Facades\Schedule;

// Automatic Performance Evaluations (Maalinle, Isbuucle, Bile)
Schedule::command('mosque:send-evaluations daily')->dailyAt('21:00');
Schedule::command('mosque:send-evaluations weekly')->weeklyOn(5, '20:00');
Schedule::command('mosque:send-evaluations monthly')->monthlyOn(1, '08:00');

