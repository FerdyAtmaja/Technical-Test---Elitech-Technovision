<?php

namespace Tests\Feature;

use App\Models\Item;
use App\Models\Transaction;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class TransactionTest extends TestCase
{
    use RefreshDatabase;

    public function test_can_get_all_transactions()
    {
        Transaction::factory()->count(3)->create();

        $response = $this->getJson('/api/transactions');

        $response->assertStatus(200)
                 ->assertJsonCount(3);
    }

    public function test_can_create_transaction()
    {
        $item = Item::factory()->create();

        $transactionData = [
            'item_id' => $item->id,
            'jenis_transaksi' => 'masuk',
            'tanggal_transaksi' => '2024-01-15',
            'jumlah' => 10,
            'keterangan' => 'Pembelian barang'
        ];

        $response = $this->postJson('/api/transactions', $transactionData);

        $response->assertStatus(201)
                 ->assertJsonStructure([
                     'id', 'item_id', 'jenis_transaksi', 'tanggal_transaksi', 'jumlah', 'keterangan'
                 ]);
    }

    public function test_can_get_single_transaction()
    {
        $transaction = Transaction::factory()->create();

        $response = $this->getJson("/api/transactions/{$transaction->id}");

        $response->assertStatus(200)
                 ->assertJson(['id' => $transaction->id]);
    }
}