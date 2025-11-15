<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Transaction;
use App\Models\Item;
use Illuminate\Http\Request;

class TransactionController extends Controller
{
    public function index()
    {
        return Transaction::with('item')->get();
    }

    public function store(Request $request)
    {
        $transaction = Transaction::create($request->all());
        return response()->json($transaction->load('item'), 201);
    }

    public function show(Transaction $transaction)
    {
        return $transaction->load('item');
    }

    public function update(Request $request, Transaction $transaction)
    {
        $transaction->update($request->all());
        return $transaction->load('item');
    }

    public function destroy(Transaction $transaction)
    {
        $transaction->delete();
        return response()->json(null, 204);
    }
}