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
        $expected = ['kode_barang', 'nama_barang', 'satuan', 'stock_awal', 'stock', 'created_by', 'updated_by', 'deleted_by', 'lock_version'];
        
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
        $item = Item::factory()->create(['stock' => 7]);
        
        // calculateStock() method returns current stock, not calculated from transactions
        $this->assertEquals(7, $item->calculateStock());
    }

    public function test_casts_are_correct()
    {
        $item = new Item();
        $expected = ['id' => 'int', 'stock_awal' => 'integer', 'stock' => 'integer', 'lock_version' => 'integer', 'deleted_at' => 'datetime'];
        
        $this->assertEquals($expected, $item->getCasts());
    }
}