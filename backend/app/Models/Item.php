<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'kode_barang',
        'nama_barang', 
        'satuan',
        'stock'
    ];

    protected $casts = [
        'stock' => 'integer'
    ];

    public function transactions()
    {
        return $this->hasMany(Transaction::class);
    }

    public function getCurrentStock()
    {
        $masuk = $this->transactions()->where('jenis_transaksi', 'masuk')->sum('jumlah');
        $keluar = $this->transactions()->where('jenis_transaksi', 'keluar')->sum('jumlah');
        
        return $this->stock + $masuk - $keluar;
    }

    public function calculateStock()
    {
        return $this->getCurrentStock();
    }
}