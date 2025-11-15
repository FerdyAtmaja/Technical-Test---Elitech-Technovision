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

    public function test_user_can_view_report_page()
    {
        $user = User::factory()->create();

        $response = $this->actingAs($user)->getJson('/api/reports');

        $response->assertStatus(200);
    }

    public function test_report_returns_correct_stock_values()
    {
        $user = User::factory()->create();
        $item = Item::factory()->create(['stock' => 10, 'nama_barang' => 'Test Item']);

        $response = $this->actingAs($user)->getJson('/api/reports');

        $response->assertStatus(200)
                 ->assertJsonFragment([
                     'nama_barang' => 'Test Item',
                     'stock' => 10
                 ]);
    }

    public function test_report_can_be_filtered_by_date_range()
    {
        $user = User::factory()->create();
        $item = Item::factory()->create();
        
        Transaction::factory()->create([
            'item_id' => $item->id,
            'tanggal_transaksi' => '2024-01-01'
        ]);
        
        Transaction::factory()->create([
            'item_id' => $item->id,
            'tanggal_transaksi' => '2024-02-01'
        ]);

        $response = $this->actingAs($user)->getJson('/api/reports?start_date=2024-01-01&end_date=2024-01-31');

        $response->assertStatus(200);
    }
}
