<?php

namespace Tests\Feature;

use App\Models\Item;
use App\Models\Transaction;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class TransactionTest extends TestCase
{
    use RefreshDatabase;

    public function test_user_can_create_masuk_transaction()
    {
        $user = User::factory()->create();
        $item = Item::factory()->create(['stock' => 10]);

        $response = $this->actingAs($user)->postJson('/api/transactions', [
            'item_id' => $item->id,
            'jenis_transaksi' => 'masuk',
            'tanggal_transaksi' => '2024-01-01',
            'jumlah' => 5,
            'keterangan' => 'Stock masuk'
        ]);

        $response->assertStatus(201);
    }

    public function test_user_can_create_keluar_transaction()
    {
        $user = User::factory()->create();
        $item = Item::factory()->create(['stock' => 10]);

        $response = $this->actingAs($user)->postJson('/api/transactions', [
            'item_id' => $item->id,
            'jenis_transaksi' => 'keluar',
            'tanggal_transaksi' => '2024-01-01',
            'jumlah' => 3,
            'keterangan' => 'Stock keluar'
        ]);

        $response->assertStatus(201);
    }

    public function test_transaction_must_reduce_or_add_stock_correctly()
    {
        $user = User::factory()->create();
        $item = Item::factory()->create(['stock' => 10]);

        // Test masuk transaction
        $this->actingAs($user)->postJson('/api/transactions', [
            'item_id' => $item->id,
            'jenis_transaksi' => 'masuk',
            'tanggal_transaksi' => '2024-01-01',
            'jumlah' => 5
        ]);

        $item->refresh();
        $this->assertEquals(15, $item->stock);

        // Test keluar transaction
        $this->actingAs($user)->postJson('/api/transactions', [
            'item_id' => $item->id,
            'jenis_transaksi' => 'keluar',
            'tanggal_transaksi' => '2024-01-01',
            'jumlah' => 3
        ]);

        $item->refresh();
        $this->assertEquals(12, $item->stock);
    }

    public function test_transaction_requires_item_id()
    {
        $user = User::factory()->create();

        $response = $this->actingAs($user)->postJson('/api/transactions', [
            'jenis_transaksi' => 'masuk',
            'tanggal_transaksi' => '2024-01-01',
            'jumlah' => 5
        ]);

        $response->assertStatus(422)
                 ->assertJsonValidationErrors('item_id');
    }

    public function test_transaction_jumlah_must_be_positive()
    {
        $user = User::factory()->create();
        $item = Item::factory()->create();

        $response = $this->actingAs($user)->postJson('/api/transactions', [
            'item_id' => $item->id,
            'jenis_transaksi' => 'masuk',
            'tanggal_transaksi' => '2024-01-01',
            'jumlah' => -5
        ]);

        $response->assertStatus(422)
                 ->assertJsonValidationErrors('jumlah');
    }

    public function test_cannot_make_transaction_if_not_enough_stock()
    {
        $user = User::factory()->create();
        $item = Item::factory()->create(['stock' => 5]);

        $response = $this->actingAs($user)->postJson('/api/transactions', [
            'item_id' => $item->id,
            'jenis_transaksi' => 'keluar',
            'tanggal_transaksi' => '2024-01-01',
            'jumlah' => 10
        ]);

        $response->assertStatus(422);
    }

    public function test_user_must_be_authenticated_to_make_transactions()
    {
        $response = $this->postJson('/api/transactions', []);
        $response->assertStatus(401);
    }
}
