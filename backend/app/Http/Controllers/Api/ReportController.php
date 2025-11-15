<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Item;
use Illuminate\Http\Request;

class ReportController extends Controller
{
    public function stockReport(Request $request)
    {
        $items = Item::with('transactions')->get();
        
        $report = $items->map(function ($item) {
            return [
                'id' => $item->id,
                'kode_barang' => $item->kode_barang,
                'nama_barang' => $item->nama_barang,
                'satuan' => $item->satuan,
                'stok_awal' => $item->stock,
                'stok_akhir' => $item->getCurrentStock()
            ];
        });

        return response()->json($report);
    }
}