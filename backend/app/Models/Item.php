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
        'stock_awal',
        'stock',
        'created_by',
        'updated_by',
        'deleted_by',
        'lock_version'
    ];

    protected $casts = [
        'stock_awal' => 'integer',
        'stock' => 'integer',
        'lock_version' => 'integer'
    ];

    protected static function booted()
    {
        static::creating(function ($model) {
            // Set created_by saat create
            $model->created_by = auth()->id();
            
            // Set stock_awal = stock saat create
            if (!$model->stock_awal && $model->stock) {
                $model->stock_awal = $model->stock;
            }
        });

        static::created(function ($model) {
            $model->logAudit('created');
        });

        static::updating(function ($model) {
            $model->updated_by = auth()->id();
        });

        static::updated(function ($model) {
            $model->logAudit('updated');
        });

        static::deleting(function ($model) {
            $model->deleted_by = auth()->id();
            $model->save();
        });

        static::deleted(function ($model) {
            $model->logAudit('deleted');
        });
    }

    public function transactions()
    {
        return $this->hasMany(Transaction::class);
    }

    public function updatedBy()
    {
        return $this->belongsTo(User::class, 'updated_by');
    }

    public function deletedBy()
    {
        return $this->belongsTo(User::class, 'deleted_by');
    }

    public function createdBy()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function getCurrentStock()
    {
        return $this->stock;
    }

    public function getInitialStock()
    {
        return $this->stock_awal;
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