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
            // Buat banyak transaksi masuk untuk semua item
            foreach ($items as $item) {
                for ($i = 0; $i < rand(3, 6); $i++) {
                    Transaction::create([
                        'item_id' => $item->id,
                        'jenis_transaksi' => 'masuk',
                        'tanggal_transaksi' => now()->subDays(rand(30, 90)),
                        'jumlah' => rand(10, 100),
                        'keterangan' => $this->getRandomIncomingReason()
                    ]);
                }
            }
            
            // Buat 150 transaksi keluar dengan validasi stok
            $createdOut = 0;
            $attempts = 0;
            while ($createdOut < 150 && $attempts < 500) {
                $item = $items->random();
                $stokTersedia = $item->calculateStock();
                
                if ($stokTersedia > 0) {
                    $jumlahKeluar = rand(1, min(15, $stokTersedia));
                    Transaction::create([
                        'item_id' => $item->id,
                        'jenis_transaksi' => 'keluar',
                        'tanggal_transaksi' => now()->subDays(rand(1, 60)),
                        'jumlah' => $jumlahKeluar,
                        'keterangan' => $this->getRandomOutgoingReason()
                    ]);
                    $createdOut++;
                }
                $attempts++;
            }
        }
    }
    
    private function getRandomIncomingReason(): string
    {
        $reasons = [
            'Pembelian dari supplier utama',
            'Restok barang habis',
            'Pembelian bulk order',
            'Pengadaan barang baru',
            'Pembelian dari distributor',
            'Restok inventory bulanan'
        ];
        return $reasons[array_rand($reasons)];
    }
    
    private function getRandomOutgoingReason(): string
    {
        $reasons = [
            'Penjualan ke customer',
            'Penggunaan internal',
            'Distribusi ke cabang',
            'Penjualan online',
            'Penjualan retail',
            'Konsumsi kantor',
            'Peminjaman departemen'
        ];
        return $reasons[array_rand($reasons)];
    }
}
