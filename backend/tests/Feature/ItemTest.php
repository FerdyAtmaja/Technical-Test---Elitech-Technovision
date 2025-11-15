<?php

namespace Tests\Feature;

use App\Models\Item;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ItemTest extends TestCase
{
    use RefreshDatabase;

    public function test_user_can_view_items_list()
    {
        $user = User::factory()->create();
        Item::factory()->create(['nama_barang' => 'Test Item']);

        $response = $this->actingAs($user)->getJson('/api/items');

        $response->assertStatus(200)
                 ->assertJsonStructure(['*' => ['id', 'kode_barang', 'nama_barang', 'satuan', 'stock']]);
    }

    public function test_user_can_create_item()
    {
        $user = User::factory()->create();

        $response = $this->actingAs($user)->postJson('/api/items', [
            'kode_barang' => 'ITM001',
            'nama_barang' => 'Test Item',
            'satuan' => 'pcs',
            'stock' => 10
        ]);

        $response->assertStatus(201)
                 ->assertJsonStructure(['id', 'kode_barang', 'nama_barang', 'satuan', 'stock']);
    }

    public function test_user_can_update_item()
    {
        $user = User::factory()->create();
        $item = Item::factory()->create();

        $response = $this->actingAs($user)->putJson("/api/items/{$item->id}", [
            'kode_barang' => 'ITM002',
            'nama_barang' => 'Updated Item',
            'satuan' => 'kg',
            'stock' => 20
        ]);

        $response->assertStatus(200);
    }

    public function test_user_can_delete_item()
    {
        $user = User::factory()->create();
        $item = Item::factory()->create();

        $response = $this->actingAs($user)->deleteJson("/api/items/{$item->id}");

        $response->assertStatus(200);
        $this->assertDatabaseMissing('items', ['id' => $item->id]);
    }

    public function test_nama_barang_is_required()
    {
        $user = User::factory()->create();

        $response = $this->actingAs($user)->postJson('/api/items', [
            'kode_barang' => 'ITM001',
            'satuan' => 'pcs'
        ]);

        $response->assertStatus(422)
                 ->assertJsonValidationErrors('nama_barang');
    }

    public function test_stock_must_be_numeric()
    {
        $user = User::factory()->create();

        $response = $this->actingAs($user)->postJson('/api/items', [
            'kode_barang' => 'ITM001',
            'nama_barang' => 'Test Item',
            'satuan' => 'pcs',
            'stock' => 'invalid'
        ]);

        $response->assertStatus(422)
                 ->assertJsonValidationErrors('stock');
    }

    public function test_kode_barang_must_be_unique()
    {
        $user = User::factory()->create();
        Item::factory()->create(['kode_barang' => 'ITM001']);

        $response = $this->actingAs($user)->postJson('/api/items', [
            'kode_barang' => 'ITM001',
            'nama_barang' => 'Test Item',
            'satuan' => 'pcs'
        ]);

        $response->assertStatus(422)
                 ->assertJsonValidationErrors('kode_barang');
    }

    public function test_user_must_be_authenticated_to_manage_items()
    {
        $response = $this->getJson('/api/items');
        $response->assertStatus(401);

        $response = $this->postJson('/api/items', []);
        $response->assertStatus(401);
    }
}
