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

        $keteranganMasuk = [
            'Pembelian rutin bulanan',
            'Restok barang habis',
            'Pengadaan dari supplier',
            'Pembelian darurat',
            'Stok tambahan',
            'Pengisian ulang inventory',
            'Pembelian bulk',
            'Restok mingguan'
        ];

        $keteranganKeluar = [
            'Penggunaan operasional',
            'Distribusi ke cabang',
            'Pemakaian harian',
            'Kebutuhan proyek',
            'Konsumsi rutin',
            'Penggunaan maintenance',
            'Alokasi departemen',
            'Pemakaian darurat'
        ];

        foreach ($items as $item) {

            // 1. TRANSAKSI MASUK
            $qtyIn = rand(5, 20);

            Transaction::create([
                'item_id' => $item->id,
                'jenis_transaksi' => 'masuk',
                'jumlah' => $qtyIn,
                'tanggal_transaksi' => now()->subDays(rand(5, 20)),
                'keterangan' => $keteranganMasuk[array_rand($keteranganMasuk)],
                'status' => 'aktif'
            ]);

            // 2. TRANSAKSI KELUAR (untuk beberapa item agar ada yang stok menipis)
            if (rand(1, 3) === 1) { // 1/3 kemungkinan ada transaksi keluar
                $maxOut = max(1, $item->stock - rand(1, 5));
                $qtyOut = rand(1, $maxOut);

                Transaction::create([
                    'item_id' => $item->id,
                    'jenis_transaksi' => 'keluar',
                    'jumlah' => $qtyOut,
                    'tanggal_transaksi' => now()->subDays(rand(1, 4)),
                    'keterangan' => $keteranganKeluar[array_rand($keteranganKeluar)],
                    'status' => 'aktif'
                ]);
            }
        }
    }
}