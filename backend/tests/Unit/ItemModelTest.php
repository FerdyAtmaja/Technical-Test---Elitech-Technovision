<?php

namespace Tests\Unit;

use App\Models\Item;
use App\Models\Transaction;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ItemModelTest extends TestCase
{
    use RefreshDatabase;

    public function test_fillable_fields_are_correct()
    {
        $item = new Item();
        $expected = ['kode_barang', 'nama_barang', 'satuan', 'stock'];
        
        $this->assertEquals($expected, $item->getFillable());
    }

    public function test_item_has_transactions_relationship()
    {
        $item = Item::factory()->create();
        Transaction::factory()->create(['item_id' => $item->id]);
        
        $this->assertInstanceOf('Illuminate\Database\Eloquent\Collection', $item->transactions);
        $this->assertInstanceOf(Transaction::class, $item->transactions->first());
    }

    public function test_stock_calculation_method_works()
    {
        $item = Item::factory()->create();
        
        Transaction::factory()->create([
            'item_id' => $item->id,
            'jenis_transaksi' => 'masuk',
            'jumlah' => 10
        ]);
        
        Transaction::factory()->create([
            'item_id' => $item->id,
            'jenis_transaksi' => 'keluar',
            'jumlah' => 3
        ]);
        
        $this->assertEquals(7, $item->calculateStock());
    }

    public function test_casts_are_correct()
    {
        $item = new Item();
        $expected = ['stock' => 'integer'];
        
        $this->assertEquals($expected, $item->getCasts());
    }
}
