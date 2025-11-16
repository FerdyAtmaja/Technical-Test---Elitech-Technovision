<?php

namespace Database\Seeders;

use App\Models\Item;
use Illuminate\Database\Seeder;

class ItemSeeder extends Seeder
{
    public function run(): void
    {
        $items = [
            ['nama_barang' => 'Tensimeter Digital', 'satuan' => 'pcs', 'stock' => 15],
            ['nama_barang' => 'Termometer Infrared', 'satuan' => 'pcs', 'stock' => 25],
            ['nama_barang' => 'Pulse Oximeter', 'satuan' => 'pcs', 'stock' => 30],
            ['nama_barang' => 'Nebulizer Portable', 'satuan' => 'pcs', 'stock' => 12],
            ['nama_barang' => 'Glucometer', 'satuan' => 'pcs', 'stock' => 20],
            ['nama_barang' => 'Stetoskop Digital', 'satuan' => 'pcs', 'stock' => 8],
            ['nama_barang' => 'Defibrilator AED', 'satuan' => 'pcs', 'stock' => 3],
            ['nama_barang' => 'ECG Machine', 'satuan' => 'pcs', 'stock' => 5],
            ['nama_barang' => 'Infusion Pump', 'satuan' => 'pcs', 'stock' => 10],
            ['nama_barang' => 'Suction Unit', 'satuan' => 'pcs', 'stock' => 7],
            ['nama_barang' => 'Laptop Dell Inspiron', 'satuan' => 'pcs', 'stock' => 15],
            ['nama_barang' => 'Tablet Samsung', 'satuan' => 'pcs', 'stock' => 20],
            ['nama_barang' => 'Smartphone iPhone', 'satuan' => 'pcs', 'stock' => 12],
            ['nama_barang' => 'Monitor LED 24 inch', 'satuan' => 'pcs', 'stock' => 18],
            ['nama_barang' => 'Printer Laser', 'satuan' => 'pcs', 'stock' => 8],
            ['nama_barang' => 'Projector LCD', 'satuan' => 'pcs', 'stock' => 6],
            ['nama_barang' => 'Router WiFi', 'satuan' => 'pcs', 'stock' => 25],
            ['nama_barang' => 'UPS 1000VA', 'satuan' => 'pcs', 'stock' => 10],
            ['nama_barang' => 'Scanner Document', 'satuan' => 'pcs', 'stock' => 5],
            ['nama_barang' => 'External HDD 1TB', 'satuan' => 'pcs', 'stock' => 30]
        ];

        $lastItem = Item::withTrashed()->orderBy('kode_barang', 'desc')->first();
        $startNumber = $lastItem ? (int) substr($lastItem->kode_barang, 3) + 1 : 1;

        // Buat 20 items manual
        foreach ($items as $index => $itemData) {
            $nextNumber = $startNumber + $index;
            $itemData['kode_barang'] = 'BRG' . str_pad($nextNumber, 3, '0', STR_PAD_LEFT);
            
            if (!Item::where('nama_barang', $itemData['nama_barang'])->exists()) {
                Item::create($itemData);
            }
        }
        
        // Buat 20 items random menggunakan factory
        Item::factory(20)->create();
    }
}