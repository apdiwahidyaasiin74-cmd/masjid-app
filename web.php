<?php

use App\Http\Controllers\AdminPerformanceController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CommitteeController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\ImamController;
use App\Http\Controllers\LoginActivityController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\PrayerController;
use App\Http\Controllers\SubscriptionController;
use App\Http\Controllers\SuperAdminController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\WarningController;
use Illuminate\Support\Facades\Route;

// Guest Routes
Route::middleware('guest')->group(function () {
    Route::get('/', function () {
        return redirect()->route('login');
    });
    Route::get('/login', [AuthController::class, 'showLogin'])->name('login');
    Route::post('/login', [AuthController::class, 'login']);
});

// Authenticated Routes
Route::middleware('auth')->group(function () {
    // Logout (accessible to any authenticated user)
    Route::get('/logout', [AuthController::class, 'logout'])->name('logout');
    Route::post('/logout', [AuthController::class, 'logout']);

    // Dashboard (role/permission-aware routing)
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

    // Notifications (internal system alert checking for employees/all & sending announcements)
    Route::get('/notifications', [NotificationController::class, 'index'])->name('notifications.index');
    Route::post('/notifications/send-announcement', [NotificationController::class, 'sendAnnouncement'])->name('notifications.send_announcement');
    Route::post('/notifications/{notification}/read', [NotificationController::class, 'read'])->name('notifications.read');
    Route::post('/notifications/read-all', [NotificationController::class, 'readAll'])->name('notifications.read_all');

    // ========================================================
    // RBAC Protected Administrative Modules
    // ========================================================

    // Committee Management
    Route::middleware('permission:manage-committee')->group(function () {
        Route::get('/committee', [CommitteeController::class, 'index'])->name('committee.index');
        Route::get('/committee/create', [CommitteeController::class, 'create'])->name('committee.create');
        Route::post('/committee', [CommitteeController::class, 'store'])->name('committee.store');
        Route::get('/committee/{committee}', [CommitteeController::class, 'show'])->name('committee.show');
        Route::get('/committee/{committee}/edit', [CommitteeController::class, 'edit'])->name('committee.edit');
        Route::put('/committee/{committee}', [CommitteeController::class, 'update'])->name('committee.update');
        Route::delete('/committee/{committee}', [CommitteeController::class, 'destroy'])->name('committee.destroy');
    });

    // Imam Management
    Route::middleware('permission:manage-imams')->group(function () {
        Route::get('/imams', [ImamController::class, 'index'])->name('imams.index');
        Route::get('/imams/create', [ImamController::class, 'create'])->name('imams.create');
        Route::post('/imams', [ImamController::class, 'store'])->name('imams.store');
        Route::get('/imams/{imam}', [ImamController::class, 'show'])->name('imams.show');
        Route::get('/imams/{imam}/edit', [ImamController::class, 'edit'])->name('imams.edit');
        Route::put('/imams/{imam}', [ImamController::class, 'update'])->name('imams.update');
        Route::delete('/imams/{imam}', [ImamController::class, 'destroy'])->name('imams.destroy');
        Route::post('/imams/{imam}/reset-flags', [ImamController::class, 'resetFlags'])->name('imams.reset_flags');
    });

    // Prayer Management (Types, Times, Schedules)
    Route::middleware('permission:manage-prayers')->group(function () {
        Route::post('/prayers/types/quick-add', [PrayerController::class, 'quickAddType'])->name('prayers.types.quick_add');

        Route::get('/prayers/schedules', [PrayerController::class, 'schedulesIndex'])->name('prayers.schedules');
        Route::get('/prayers/schedules/create', [PrayerController::class, 'schedulesCreate'])->name('prayers.schedules.create');
        Route::post('/prayers/schedules', [PrayerController::class, 'schedulesStore']);
        Route::get('/prayers/schedules/{schedule}/edit', [PrayerController::class, 'schedulesEdit'])->name('prayers.schedules.edit');
        Route::put('/prayers/schedules/{schedule}', [PrayerController::class, 'schedulesUpdate'])->name('prayers.schedules.update');
        Route::delete('/prayers/schedules/{schedule}', [PrayerController::class, 'schedulesDestroy'])->name('prayers.schedules.destroy');
        Route::post('/prayers/schedules/{schedule}/flag', [PrayerController::class, 'updateFlag'])->name('prayers.schedules.update_flag');
    });

    // Employee Management
    Route::middleware('permission:manage-employees')->group(function () {
        Route::get('/employees/roles', [EmployeeController::class, 'rolesIndex'])->name('employees.roles');
        Route::post('/employees/roles', [EmployeeController::class, 'rolesStore']);
        Route::put('/employees/roles/{role}', [EmployeeController::class, 'rolesUpdate'])->name('employees.roles.update');
        Route::delete('/employees/roles/{role}', [EmployeeController::class, 'rolesDestroy'])->name('employees.roles.destroy');

        Route::get('/employees/locations', [EmployeeController::class, 'locationsIndex'])->name('employees.locations');
        Route::post('/employees/locations', [EmployeeController::class, 'locationsStore']);
        Route::put('/employees/locations/{location}', [EmployeeController::class, 'locationsUpdate'])->name('employees.locations.update');
        Route::delete('/employees/locations/{location}', [EmployeeController::class, 'locationsDestroy'])->name('employees.locations.destroy');

        Route::get('/employees', [EmployeeController::class, 'index'])->name('employees.index');
        Route::get('/employees/create', [EmployeeController::class, 'create'])->name('employees.create');
        Route::post('/employees', [EmployeeController::class, 'store'])->name('employees.store');
        Route::get('/employees/{employee}', [EmployeeController::class, 'show'])->name('employees.show');
        Route::get('/employees/{employee}/edit', [EmployeeController::class, 'edit'])->name('employees.edit');
        Route::put('/employees/{employee}', [EmployeeController::class, 'update'])->name('employees.update');
        Route::delete('/employees/{employee}', [EmployeeController::class, 'destroy'])->name('employees.destroy');
        Route::post('/employees/{employee}/locations/{pivotId}/status', [EmployeeController::class, 'updateLocationStatus'])->name('employees.update_location_status');
        Route::post('/employees/{employee}/reset-flags', [EmployeeController::class, 'resetFlags'])->name('employees.reset_flags');
    });

    // Employee Warning System
    Route::middleware('permission:manage-warnings')->group(function () {
        Route::get('/warnings/types', [WarningController::class, 'typesIndex'])->name('warnings.types');
        Route::post('/warnings/types', [WarningController::class, 'typesStore']);
        Route::put('/warnings/types/{type}', [WarningController::class, 'typesUpdate'])->name('warnings.types.update');
        Route::delete('/warnings/types/{type}', [WarningController::class, 'typesDestroy'])->name('warnings.types.destroy');

        Route::get('/warnings/settings', [WarningController::class, 'settingsIndex'])->name('warnings.settings');
        Route::post('/warnings/settings', [WarningController::class, 'settingsUpdate'])->name('warnings.settings.update');
        Route::post('/warnings/settings/send-monthly-evaluations', [WarningController::class, 'sendMonthlyEvaluations'])->name('warnings.settings.send_monthly_evaluations');
        Route::post('/warnings/settings/send-evaluations', [WarningController::class, 'sendEvaluations'])->name('warnings.settings.send_evaluations');

        Route::get('/warnings/limit-reached', [WarningController::class, 'limitReachedList'])->name('warnings.limit_reached');

        Route::get('/warnings', [WarningController::class, 'index'])->name('warnings.index');
        Route::get('/warnings/create', [WarningController::class, 'create'])->name('warnings.create');
        Route::post('/warnings', [WarningController::class, 'store'])->name('warnings.store');
        Route::get('/warnings/{warning}', [WarningController::class, 'show'])->name('warnings.show');
        Route::delete('/warnings/{warning}', [WarningController::class, 'destroy'])->name('warnings.destroy');
        Route::post('/employees/{employee}/reset-warnings', [WarningController::class, 'resetEmployeeWarnings'])->name('employees.reset_warnings');
        Route::post('/imams/{imam}/reset-warnings', [WarningController::class, 'resetImamWarnings'])->name('imams.reset_warnings');
    });

    // Login Activity Monitoring
    Route::middleware('permission:view-login-activity')->group(function () {
        Route::get('/login-activities', [LoginActivityController::class, 'index'])->name('login_activities.index');
    });

    // Admin Performance & Daily Check-in Monitoring
    Route::get('/admin/performance', [AdminPerformanceController::class, 'index'])->name('admin.performance');

    // Admin Credentials & Administrator Account Management (Restricted to user shiine or super-admin)
    Route::get('/admin/credentials', [UserController::class, 'credentials'])->name('admin.credentials');
    Route::post('/admin/users', [UserController::class, 'storeAdmin'])->name('admin.users.store');
    Route::put('/admin/users/{user}', [UserController::class, 'updateAdmin'])->name('admin.users.update');
    Route::delete('/admin/users/{user}', [UserController::class, 'destroyAdmin'])->name('admin.users.destroy');

    // Subscription routes
    Route::get('/subscription/pay', [SubscriptionController::class, 'pay'])->name('subscription.pay');
    Route::post('/subscription/pay', [SubscriptionController::class, 'processPayment'])->name('subscription.process_payment');
    Route::get('/subscription/blocked', [SubscriptionController::class, 'blockedNotice'])->name('subscription.blocked_notice');

    // Super Admin / Developer panel routes
    Route::get('/superadmin/dashboard', [SuperAdminController::class, 'index'])->name('superadmin.dashboard');
    Route::post('/superadmin/toggle-block/{user}', [SuperAdminController::class, 'toggleBlock'])->name('superadmin.toggle_block');
    Route::post('/superadmin/settings', [SuperAdminController::class, 'updateSettings'])->name('superadmin.update_settings');
    Route::post('/superadmin/update-price/{user}', [SuperAdminController::class, 'updatePrice'])->name('superadmin.update_price');
});
