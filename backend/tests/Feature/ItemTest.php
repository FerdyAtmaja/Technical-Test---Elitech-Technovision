<?php

namespace Tests\Feature;

use App\Models\Item;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ItemTest extends TestCase
{
    use RefreshDatabase;
    
    protected function setUp(): void
    {
        parent::setUp();
        $this->actingAs(User::factory()->create());
    }

    public function test_can_get_all_items()
    {
        Item::factory()->count(3)->create();

        $response = $this->getJson('/api/items');

        $response->assertStatus(200)
                 ->assertJsonStructure([
                     'data',
                     'current_page',
                     'per_page',
                     'total'
                 ])
                 ->assertJsonCount(3, 'data');
    }

    public function test_can_create_item()
    {
        $itemData = [
            'kode_barang' => 'BRG-001',
            'nama_barang' => 'Laptop',
            'satuan' => 'pcs',
            'stock' => 10
        ];

        $response = $this->postJson('/api/items', $itemData);

        $response->assertStatus(201)
                 ->assertJsonStructure([
                     'id', 'kode_barang', 'nama_barang', 'satuan', 'stock', 'stock_awal'
                 ]);
    }

    public function test_can_get_single_item()
    {
        $item = Item::factory()->create();

        $response = $this->getJson("/api/items/{$item->id}");

        $response->assertStatus(200)
                 ->assertJson(['id' => $item->id]);
    }

    public function test_can_update_item()
    {
        $item = Item::factory()->create();

        $response = $this->putJson("/api/items/{$item->id}", [
            'kode_barang' => 'BRG-002',
            'nama_barang' => 'Updated Item',
            'satuan' => 'kg',
            'stock' => 20
        ]);

        $response->assertStatus(200);
    }

    public function test_can_delete_item()
    {
        $item = Item::factory()->create();

        $response = $this->deleteJson("/api/items/{$item->id}");

        $response->assertStatus(204);
        $this->assertSoftDeleted('items', ['id' => $item->id]);
    }
}
