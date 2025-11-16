<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\ItemController;
use App\Http\Controllers\Api\TransactionController;
use App\Http\Controllers\Api\ReportController;

Route::middleware(['auth:sanctum'])->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware(['throttle:api'])->group(function () {
    Route::apiResource('items', ItemController::class);
    Route::get('items/{item}/check-transactions', [ItemController::class, 'checkTransactions']);
    Route::get('items-next-code', [ItemController::class, 'getNextCode']);
    Route::get('items-units', [ItemController::class, 'getUnits']);
    Route::apiResource('transactions', TransactionController::class);
    Route::get('reports/stock', [ReportController::class, 'stockReport']);
});

