<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Transaction;
use App\Models\Item;
use Illuminate\Http\Request;

class TransactionController extends Controller
{
    public function index(Request $request)
    {
        $query = Transaction::with('item');
        
        // Search
        if ($request->has('search') && $request->search) {
            $search = $request->search;
            $query->whereHas('item', function($q) use ($search) {
                $q->where('kode_barang', 'like', "%{$search}%")
                  ->orWhere('nama_barang', 'like', "%{$search}%");
            })->orWhere('keterangan', 'like', "%{$search}%");
        }
        
        // Filter by jenis_transaksi
        if ($request->has('jenis_transaksi')) {
            $query->where('jenis_transaksi', $request->jenis_transaksi);
        }
        
        // Sorting
        $sortBy = $request->get('sort_by', 'tanggal_transaksi');
        $sortOrder = $request->get('sort_order', 'desc');
        
        if (in_array($sortBy, ['id', 'tanggal_transaksi', 'jumlah', 'jenis_transaksi'])) {
            $query->orderBy($sortBy, $sortOrder);
        }
        
        // Pagination
        $perPage = $request->get('per_page', 10);
        
        return $query->paginate($perPage);
    }

    public function store(Request $request)
    {
        $request->validate([
            'item_id' => 'required|exists:items,id',
            'jenis_transaksi' => 'required|in:masuk,keluar',
            'tanggal_transaksi' => 'required|date',
            'jumlah' => 'required|integer|min:1',
            'keterangan' => 'nullable|string|max:500',
            'status' => 'nullable|in:aktif,dibatalkan,restored'
        ]);

        // Validasi stok untuk transaksi keluar
        if ($request->jenis_transaksi === 'keluar') {
            $item = Item::find($request->item_id);
            $currentStock = $item->getCurrentStock();
            
            if ($request->jumlah > $currentStock) {
                return response()->json([
                    'message' => 'Stok tidak mencukupi. Stok tersedia: ' . $currentStock
                ], 422);
            }
        }

        $data = $request->all();
        $data['status'] = $data['status'] ?? 'aktif';
        
        $transaction = Transaction::create($data);
        return response()->json($transaction->load('item'), 201);
    }

    public function show(Transaction $transaction)
    {
        return $transaction->load('item');
    }

    public function update(Request $request, Transaction $transaction)
    {
        $request->validate([
            'item_id' => 'required|exists:items,id',
            'jenis_transaksi' => 'required|in:masuk,keluar',
            'tanggal_transaksi' => 'required|date',
            'jumlah' => 'required|integer|min:1',
            'keterangan' => 'nullable|string|max:500',
            'status' => 'nullable|in:aktif,dibatalkan,restored'
        ]);

        $transaction->update($request->all());
        return $transaction->load('item');
    }

    public function destroy(Transaction $transaction)
    {
        $transaction->delete();
        return response()->json(null, 204);
    }

    public function cancel(Transaction $transaction)
    {
        if ($transaction->status === 'dibatalkan') {
            return response()->json([
                'message' => 'Transaksi sudah dibatalkan'
            ], 422);
        }

        $transaction->cancel();
        
        return response()->json([
            'message' => 'Transaksi berhasil dibatalkan',
            'data' => $transaction->load('item')
        ]);
    }

    public function restore(Transaction $transaction)
    {
        if ($transaction->status === 'aktif' || $transaction->status === 'restored') {
            return response()->json([
                'message' => 'Transaksi sudah aktif'
            ], 422);
        }

        try {
            $transaction->restore();
            
            return response()->json([
                'message' => 'Transaksi berhasil dipulihkan',
                'data' => $transaction->load('item')
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'message' => $e->getMessage()
            ], 422);
        }
    }
}