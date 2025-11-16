<?php

namespace Database\Seeders;

use App\Models\Item;
use Illuminate\Database\Seeder;

class ItemSeeder extends Seeder
{
    public function run(): void
    {
        if (Item::count() == 0) {
            $items = [
                [
                    'kode_barang' => 'BRG-001',
                    'nama_barang' => 'Laptop Dell Inspiron',
                    'satuan' => 'pcs',
                    'stock' => 15
                ],
                [
                    'kode_barang' => 'BRG-002', 
                    'nama_barang' => 'Mouse Wireless',
                    'satuan' => 'pcs',
                    'stock' => 50
                ],
                [
                    'kode_barang' => 'BRG-003',
                    'nama_barang' => 'Keyboard Mechanical',
                    'satuan' => 'pcs', 
                    'stock' => 25
                ],
                [
                    'kode_barang' => 'BRG-004',
                    'nama_barang' => 'Monitor LED 24 inch',
                    'satuan' => 'pcs',
                    'stock' => 10
                ],
                [
                    'kode_barang' => 'BRG-005',
                    'nama_barang' => 'Kertas A4',
                    'satuan' => 'box',
                    'stock' => 100
                ]
            ];

            foreach ($items as $item) {
                Item::create($item);
            }

            Item::factory(10)->create();
        }
    }
}
