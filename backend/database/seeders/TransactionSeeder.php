<?php

namespace Database\Seeders;

use App\Models\Item;
use App\Models\Transaction;
use Illuminate\Database\Seeder;

class TransactionSeeder extends Seeder
{
    public function run(): void
    {
        $items = Item::all();
        
        if ($items->count() > 0) {
            foreach ($items->take(5) as $item) {
                // Transaksi masuk
                Transaction::create([
                    'item_id' => $item->id,
                    'jenis_transaksi' => 'masuk',
                    'tanggal_transaksi' => now()->subDays(rand(1, 30)),
                    'jumlah' => rand(5, 20),
                    'keterangan' => 'Pembelian barang dari supplier'
                ]);
                
                // Transaksi keluar
                Transaction::create([
                    'item_id' => $item->id,
                    'jenis_transaksi' => 'keluar',
                    'tanggal_transaksi' => now()->subDays(rand(1, 15)),
                    'jumlah' => rand(1, 10),
                    'keterangan' => 'Penjualan ke customer'
                ]);
            }
            
            Transaction::factory(20)->create();
        }
    }
}
