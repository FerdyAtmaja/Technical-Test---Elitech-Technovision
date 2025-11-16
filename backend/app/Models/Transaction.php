<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Transaction extends Model
{
    use HasFactory, SoftDeletes;
    
    protected $fillable = [
        'item_id',
        'jenis_transaksi',
        'tanggal_transaksi', 
        'jumlah',
        'keterangan',
        'status',
        'canceled_at',
        'canceled_by',
        'restored_at',
        'restored_by',
        'lock_version'
    ];

    protected $casts = [
        'tanggal_transaksi' => 'date',
        'jumlah' => 'integer',
        'canceled_at' => 'datetime',
        'restored_at' => 'datetime',
        'lock_version' => 'integer'
    ];

    protected static function booted()
    {
        static::created(function ($transaction) {
            if ($transaction->status === 'aktif') {
                $transaction->updateItemStock();
            }
            $transaction->logAudit('created');
        });

        static::updated(function ($transaction) {
            if ($transaction->wasChanged('status')) {
                $transaction->updateItemStock();
            }
            $transaction->logAudit('updated');
        });

        static::deleted(function ($transaction) {
            $transaction->revertItemStock();
            $transaction->logAudit('deleted');
        });
    }

    public function item()
    {
        return $this->belongsTo(Item::class);
    }

    public function updateItemStock()
    {
        $item = $this->item;
        if ($this->status === 'aktif' || $this->status === 'restored') {
            if ($this->jenis_transaksi === 'masuk') {
                $item->increment('stock', $this->jumlah);
            } else {
                // Validasi stok sebelum mengurangi
                if ($item->stock >= $this->jumlah) {
                    $item->decrement('stock', $this->jumlah);
                }
            }
        }
    }

    public function revertItemStock()
    {
        $item = $this->item;
        if ($this->status === 'aktif' || $this->status === 'restored') {
            if ($this->jenis_transaksi === 'masuk') {
                // Validasi stok sebelum mengurangi
                if ($item->stock >= $this->jumlah) {
                    $item->decrement('stock', $this->jumlah);
                }
            } else {
                $item->increment('stock', $this->jumlah);
            }
        }
    }

    public function cancel()
    {
        if ($this->status === 'aktif' || $this->status === 'restored') {
            $item = $this->item;
            if ($this->jenis_transaksi === 'masuk') {
                // Validasi stok sebelum mengurangi
                if ($item->stock >= $this->jumlah) {
                    $item->decrement('stock', $this->jumlah);
                }
            } else {
                $item->increment('stock', $this->jumlah);
            }
            $this->update([
                'status' => 'dibatalkan',
                'canceled_at' => now(),
                'canceled_by' => auth()->id() ?? 1
            ]);
        }
    }

    public function restore()
    {
        if ($this->status === 'dibatalkan') {
            $item = $this->item;
            
            // Validasi stok untuk transaksi keluar yang di-restore
            if ($this->jenis_transaksi === 'keluar') {
                if ($this->jumlah > $item->stock) {
                    throw new \Exception('Stok tidak mencukupi untuk restore transaksi. Stok tersedia: ' . $item->stock);
                }
            }
            
            if ($this->jenis_transaksi === 'masuk') {
                $item->increment('stock', $this->jumlah);
            } else {
                // Validasi stok sebelum mengurangi
                if ($item->stock >= $this->jumlah) {
                    $item->decrement('stock', $this->jumlah);
                }
            }
            $this->update([
                'status' => 'restored',
                'restored_at' => now(),
                'restored_by' => auth()->id() ?? 1
            ]);
        }
    }

    public function logAudit($event)
    {
        AuditLog::create([
            'auditable_type' => get_class($this),
            'auditable_id' => $this->id,
            'event' => $event,
            'old_values' => $this->getOriginal(),
            'new_values' => $this->getAttributes(),
            'user_id' => auth()->id(),
            'ip_address' => request()->ip()
        ]);
    }
}