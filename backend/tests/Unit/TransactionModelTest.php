<?php

namespace Tests\Unit;

use App\Models\Item;
use App\Models\Transaction;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class TransactionModelTest extends TestCase
{
    use RefreshDatabase;

    public function test_fillable_fields_are_correct()
    {
        $transaction = new Transaction();
        $expected = ['item_id', 'jenis_transaksi', 'tanggal_transaksi', 'jumlah', 'keterangan', 'status', 'canceled_at', 'canceled_by', 'restored_at', 'restored_by', 'lock_version'];
        
        $this->assertEquals($expected, $transaction->getFillable());
    }

    public function test_transaction_belongs_to_item()
    {
        $item = Item::factory()->create();
        $transaction = Transaction::factory()->create(['item_id' => $item->id]);
        
        $this->assertInstanceOf(Item::class, $transaction->item);
        $this->assertEquals($item->id, $transaction->item->id);
    }

    public function test_type_is_valid_value()
    {
        $transaction = Transaction::factory()->create(['jenis_transaksi' => 'masuk']);
        $this->assertEquals('masuk', $transaction->jenis_transaksi);
        
        $transaction = Transaction::factory()->create(['jenis_transaksi' => 'keluar']);
        $this->assertEquals('keluar', $transaction->jenis_transaksi);
    }

    public function test_casts_are_correct()
    {
        $transaction = new Transaction();
        $expected = ['id' => 'int', 'tanggal_transaksi' => 'date', 'jumlah' => 'integer', 'canceled_at' => 'datetime', 'restored_at' => 'datetime', 'lock_version' => 'integer'];
        
        $this->assertEquals($expected, $transaction->getCasts());
    }
}