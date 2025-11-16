<?php

namespace Database\Seeders;

use App\Models\Item;
use Illuminate\Database\Seeder;

class ItemSeeder extends Seeder
{
    public function run(): void
    {
        $items = [
            [
                'nama_barang' => 'Laptop Dell Inspiron',
                'satuan' => 'pcs',
                'stock' => 15
            ],
            [
                'nama_barang' => 'Mouse Wireless',
                'satuan' => 'pcs',
                'stock' => 50
            ],
            [
                'nama_barang' => 'Keyboard Mechanical',
                'satuan' => 'pcs', 
                'stock' => 25
            ],
            [
                'nama_barang' => 'Monitor LED 24 inch',
                'satuan' => 'pcs',
                'stock' => 10
            ],
            [
                'nama_barang' => 'Kertas A4',
                'satuan' => 'box',
                'stock' => 100
            ]
        ];

        $lastItem = Item::withTrashed()->orderBy('kode_barang', 'desc')->first();
        $startNumber = $lastItem ? (int) substr($lastItem->kode_barang, 3) + 1 : 1;

        foreach ($items as $index => $itemData) {
            $nextNumber = $startNumber + $index;
            $itemData['kode_barang'] = 'BRG' . str_pad($nextNumber, 3, '0', STR_PAD_LEFT);
            
            // Cek apakah item dengan nama yang sama sudah ada
            if (!Item::where('nama_barang', $itemData['nama_barang'])->exists()) {
                Item::create($itemData);
            }
        }
    }
}
