<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Item;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Carbon\Carbon;

class ReportController extends Controller
{
    public function stockReport(Request $request)
    {
        $query = Item::query();
        
        // Filter pencarian
        if ($request->has('search') && $request->search) {
            $search = $request->search;
            $query->where(function($q) use ($search) {
                $q->where('kode_barang', 'like', "%{$search}%")
                  ->orWhere('nama_barang', 'like', "%{$search}%");
            });
        }
        
        // Filter satuan
        if ($request->has('satuan') && $request->satuan) {
            $query->where('satuan', $request->satuan);
        }
        
        // Sorting
        $sortBy = $request->get('sort_by', 'kode_barang');
        $sortOrder = $request->get('sort_order', 'asc');
        
        if (in_array($sortBy, ['kode_barang', 'nama_barang', 'satuan', 'stok_awal', 'stock'])) {
            $query->orderBy($sortBy, $sortOrder);
        }
        
        // Pagination
        $perPage = $request->get('per_page', 10);
        $items = $query->paginate($perPage);
        
        // Filter tanggal untuk perhitungan transaksi
        $startDate = $request->start_date ? Carbon::parse($request->start_date) : null;
        $endDate = $request->end_date ? Carbon::parse($request->end_date) : null;
        
        $report = $items->getCollection()->map(function ($item) use ($startDate, $endDate) {
            // Hitung transaksi dalam periode
            $transactionQuery = $item->transactions()->whereIn('status', ['aktif', 'restored']);
            
            if ($startDate && $endDate) {
                $transactionQuery->whereBetween('tanggal_transaksi', [$startDate, $endDate]);
            }
            
            $masuk = (clone $transactionQuery)->where('jenis_transaksi', 'masuk')->sum('jumlah');
            $keluar = (clone $transactionQuery)->where('jenis_transaksi', 'keluar')->sum('jumlah');
            
            // PERBAIKAN: Stok awal dari field stok_awal, stok akhir dari field stock
            $stokAwal = $item->stok_awal;  // Dari field stok_awal
            $stokAkhir = $item->stock;     // Dari field stock (stok saat ini)
            
            // Status stok berdasarkan stok akhir (stok saat ini)
            $statusStok = 'aman';
            if ($stokAkhir <= 0) {
                $statusStok = 'habis';
            } elseif ($stokAkhir <= 10) {
                $statusStok = 'menipis';
            }
            
            return [
                'id' => $item->id,
                'kode_barang' => $item->kode_barang,
                'nama_barang' => $item->nama_barang,
                'satuan' => $item->satuan,
                'stok_awal' => $stokAwal,
                'total_masuk' => $masuk,
                'total_keluar' => $keluar,
                'stok_akhir' => $stokAkhir,
                'status_stok' => $statusStok
            ];
        });
        
        // Update collection dengan data yang sudah diproses
        $items->setCollection($report);
        
        return response()->json($items);
    }
}