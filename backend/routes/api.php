<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\ItemController;
use App\Http\Controllers\Api\TransactionController;
use App\Http\Controllers\Api\ReportController;
use App\Http\Controllers\AuthController;

Route::post('/login', [AuthController::class, 'login']);

Route::middleware(['auth:sanctum'])->group(function () {
    Route::get('/user', function (Request $request) {
        return $request->user();
    });
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/me', [AuthController::class, 'me']);
    
    Route::apiResource('items', ItemController::class);
    Route::get('items/{item}/check-transactions', [ItemController::class, 'checkTransactions']);
    Route::get('items-next-code', [ItemController::class, 'getNextCode']);
    Route::get('items-units', [ItemController::class, 'getUnits']);
    Route::apiResource('transactions', TransactionController::class);
    Route::patch('transactions/{transaction}/cancel', [TransactionController::class, 'cancel']);
    Route::patch('transactions/{transaction}/restore', [TransactionController::class, 'restore']);
    Route::get('reports/stock', [ReportController::class, 'stockReport']);
});

