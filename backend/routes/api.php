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
    Route::apiResource('transactions', TransactionController::class);
    Route::get('reports/stock', [ReportController::class, 'stockReport']);
});

