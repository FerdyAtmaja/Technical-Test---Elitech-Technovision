<?php

namespace Tests\Feature;

use App\Models\Item;
use App\Models\Transaction;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ReportTest extends TestCase
{
    use RefreshDatabase;
    
    protected function setUp(): void
    {
        parent::setUp();
        $this->actingAs(User::factory()->create());
    }

    public function test_can_view_report_page()
    {
        $response = $this->getJson('/api/reports/stock');

        $response->assertStatus(200);
    }

    public function test_report_returns_correct_stock_values()
    {
        $item = Item::factory()->create(['stock' => 10, 'nama_barang' => 'Test Item']);

        $response = $this->getJson('/api/reports/stock');

        $response->assertStatus(200)
                 ->assertJsonFragment([
                     'nama_barang' => 'Test Item',
                     'stock_awal' => 10
                 ]);
    }

    public function test_report_can_be_filtered_by_date_range()
    {
        $item = Item::factory()->create();
        
        Transaction::factory()->create([
            'item_id' => $item->id,
            'tanggal_transaksi' => '2024-01-01'
        ]);
        
        Transaction::factory()->create([
            'item_id' => $item->id,
            'tanggal_transaksi' => '2024-02-01'
        ]);

        $response = $this->getJson('/api/reports/stock?start_date=2024-01-01&end_date=2024-01-31');

        $response->assertStatus(200);
    }
}