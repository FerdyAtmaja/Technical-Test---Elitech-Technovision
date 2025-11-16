<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Item;
use Illuminate\Http\Request;

class ItemController extends Controller
{
    public function index()
    {
        return Item::all();
    }

    public function store(Request $request)
    {
        $request->validate([
            'kode_barang' => 'required|string|unique:items,kode_barang',
            'nama_barang' => 'required|string|max:255',
            'satuan' => 'required|string|max:50',
            'stock' => 'required|integer|min:0'
        ]);

        $item = Item::create($request->all());
        return response()->json($item, 201);
    }

    public function show(Item $item)
    {
        return $item;
    }

    public function update(Request $request, Item $item)
    {
        $request->validate([
            'kode_barang' => 'required|string|unique:items,kode_barang,' . $item->id,
            'nama_barang' => 'required|string|max:255',
            'satuan' => 'required|string|max:50',
            'stock' => 'required|integer|min:0'
        ]);

        $item->update($request->all());
        return $item;
    }

    public function destroy(Item $item)
    {
        $item->delete();
        return response()->json(null, 204);
    }
}
