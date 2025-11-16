<?php

namespace Database\Factories;

use App\Models\Item;
use Illuminate\Database\Eloquent\Factories\Factory;

class ItemFactory extends Factory
{
    public function definition(): array
    {
        $items = [
            'Kertas A4', 'Pulpen Biru', 'Pensil 2B', 'Spidol Hitam', 'Penghapus',
            'Stapler Kecil', 'Gunting', 'Lem Stick', 'Tinta Printer', 'Folder Plastik',
            'Buku Tulis', 'Amplop Coklat', 'Lakban Bening', 'Klip Kertas', 'Pin Board',
            'Kalkulator', 'Correction Pen', 'Highlighter', 'Marker Board', 'Sticky Notes'
        ];
        
        $lastItem = Item::withTrashed()->orderBy('kode_barang', 'desc')->first();
        $nextNumber = $lastItem ? (int) substr($lastItem->kode_barang, 3) + 1 : 21;
        
        return [
            'kode_barang' => 'BRG' . str_pad($nextNumber + $this->faker->unique()->numberBetween(1, 100), 3, '0', STR_PAD_LEFT),
            'nama_barang' => $this->faker->randomElement($items) . ' ' . $this->faker->word(),
            'satuan' => $this->faker->randomElement(['pcs', 'box', 'pack', 'rim', 'dus']),
            'stock' => $this->faker->numberBetween(10, 100)
        ];
    }
}