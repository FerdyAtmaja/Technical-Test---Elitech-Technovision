<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Item;
use Illuminate\Http\Request;

class ItemController extends Controller
{
    public function index(Request $request)
    {
        $query = Item::with(['createdBy:id,name', 'updatedBy:id,name', 'deletedBy:id,name']);
        
        // Search
        if ($request->has('search') && $request->search) {
            $search = $request->search;
            $query->where(function($q) use ($search) {
                $q->where('kode_barang', 'like', "%{$search}%")
                  ->orWhere('nama_barang', 'like', "%{$search}%")
                  ->orWhere('satuan', 'like', "%{$search}%");
            });
        }
        
        // Sorting
        $sortBy = $request->get('sort_by', 'id');
        $sortOrder = $request->get('sort_order', 'asc');
        
        if (in_array($sortBy, ['id', 'kode_barang', 'nama_barang', 'satuan', 'stock', 'stock_awal'])) {
            $query->orderBy($sortBy, $sortOrder);
        }
        
        // Pagination - allow larger per_page for dashboard
        $perPage = $request->get('per_page', 10);
        
        // Limit max per_page to prevent memory issues
        if ($perPage > 1000) {
            $perPage = 1000;
        }
        
        $items = $query->paginate($perPage);
        
        // Add current_stock alias
        $items->getCollection()->transform(function ($item) {
            $item->current_stock = $item->stock;
            return $item;
        });
        
        return $items;
    }

    public function store(Request $request)
    {
        $request->validate([
            'kode_barang' => 'required|string|unique:items,kode_barang',
            'nama_barang' => 'required|string|max:255',
            'satuan' => 'required|string|max:50',
            'stock' => 'required|integer|min:0'
        ]);

        $data = $request->all();
        $data['satuan'] = strtolower($data['satuan']);
        
        $item = Item::create($data);
        $item->load(['createdBy:id,name', 'updatedBy:id,name', 'deletedBy:id,name']);
        $item->current_stock = $item->stock;
        return response()->json($item, 201);
    }

    public function show(Item $item)
    {
        $item->load(['createdBy:id,name', 'updatedBy:id,name', 'deletedBy:id,name']);
        $item->current_stock = $item->stock;
        return $item;
    }

    public function update(Request $request, Item $item)
    {
        $request->validate([
            'kode_barang' => 'required|string|unique:items,kode_barang,' . $item->id,
            'nama_barang' => 'required|string|max:255',
            'satuan' => 'required|string|max:50',
            'stock_awal' => 'nullable|integer|min:0',
            'stock' => 'required|integer|min:0'
        ]);

        $data = $request->all();
        $data['satuan'] = strtolower($data['satuan']);
        
        $item->update($data);
        $item->load(['createdBy:id,name', 'updatedBy:id,name', 'deletedBy:id,name']);
        $item->current_stock = $item->stock;
        return $item;
    }

    public function destroy(Item $item)
    {
        $item->delete();
        return response()->json(null, 204);
    }
    
    public function getNextCode()
    {
        $lastItem = Item::withTrashed()->orderBy('kode_barang', 'desc')->first();
        
        if (!$lastItem) {
            return response()->json(['code' => 'BRG001']);
        }
        
        $lastCode = $lastItem->kode_barang;
        $number = (int) substr($lastCode, 3);
        
        do {
            $nextNumber = $number + 1;
            $nextCode = 'BRG' . str_pad($nextNumber, 3, '0', STR_PAD_LEFT);
            $exists = Item::withTrashed()->where('kode_barang', $nextCode)->exists();
            $number++;
        } while ($exists);
        
        return response()->json(['code' => $nextCode]);
    }
    
    public function checkTransactions(Item $item)
    {
        $hasTransactions = $item->transactions()->exists();
        return response()->json(['has_transactions' => $hasTransactions]);
    }
    
    public function getUnits()
    {
        $units = Item::select('satuan')
            ->distinct()
            ->whereNotNull('satuan')
            ->where('satuan', '!=', '')
            ->orderBy('satuan')
            ->pluck('satuan');
            
        return response()->json(['units' => $units]);
    }
}