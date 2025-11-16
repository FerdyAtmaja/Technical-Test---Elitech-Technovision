<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class Item extends Model
{
    use HasFactory, SoftDeletes;
    
    protected $fillable = [
        'kode_barang',
        'nama_barang', 
        'satuan',
        'stock',
        'lock_version'
    ];

    protected $casts = [
        'stock' => 'integer',
        'lock_version' => 'integer'
    ];

    protected static function booted()
    {
        static::created(function ($model) {
            $model->logAudit('created');
        });

        static::updated(function ($model) {
            $model->logAudit('updated');
        });

        static::deleted(function ($model) {
            $model->logAudit('deleted');
        });
    }

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

    public function updateWithLock(array $data)
    {
        $currentVersion = $this->lock_version;
        
        if (isset($data['lock_version']) && $data['lock_version'] != $currentVersion) {
            throw new ModelNotFoundException('Data telah diubah oleh user lain. Silakan refresh dan coba lagi.');
        }
        
        $data['lock_version'] = $currentVersion + 1;
        return $this->update($data);
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