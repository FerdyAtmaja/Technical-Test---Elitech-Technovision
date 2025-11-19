<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Item;
use App\Models\Transaction;
use Carbon\Carbon;

class DashboardController extends Controller
{
    public function stats()
    {
        // Get total items count (excluding soft deleted)
        $totalItems = Item::count();
        
        // Get total stock sum
        $totalStock = Item::sum('stock');
        
        // Get today's transactions count (aktif + restored)
        $today = Carbon::today();
        $todayTransactions = Transaction::whereDate('tanggal_transaksi', $today)
                                      ->whereIn('status', ['aktif', 'restored'])
                                      ->count();
        
        // Get low stock items (stock <= 10)
        $lowStockItems = Item::where('stock', '<=', 10)
                            ->select('id', 'kode_barang', 'nama_barang', 'stock', 'satuan')
                            ->orderBy('stock', 'asc')
                            ->get();
        
        // Get recent transactions (last 8) - aktif + restored
        $recentTransactions = Transaction::with(['item:id,kode_barang,nama_barang,satuan'])
                                        ->whereIn('status', ['aktif', 'restored'])
                                        ->orderBy('created_at', 'desc')
                                        ->limit(8)
                                        ->get();
        
        return response()->json([
            'stats' => [
                'totalItems' => $totalItems,
                'totalStock' => $totalStock,
                'todayTransactions' => $todayTransactions,
                'lowStockCount' => $lowStockItems->count()
            ],
            'lowStockItems' => $lowStockItems,
            'recentTransactions' => $recentTransactions
        ]);
    }
}