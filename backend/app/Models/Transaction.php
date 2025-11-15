<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'item_id',
        'jenis_transaksi',
        'tanggal_transaksi', 
        'jumlah',
        'keterangan'
    ];

    protected $casts = [
        'tanggal_transaksi' => 'date',
        'jumlah' => 'integer'
    ];

    public function item()
    {
        return $this->belongsTo(Item::class);
    }
}