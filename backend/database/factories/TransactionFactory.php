<?php

namespace Database\Factories;

use App\Models\Item;
use Illuminate\Database\Eloquent\Factories\Factory;

class TransactionFactory extends Factory
{
    public function definition(): array
    {
        return [
            'item_id' => Item::factory(),
            'jenis_transaksi' => $this->faker->randomElement(['masuk', 'keluar']),
            'tanggal_transaksi' => $this->faker->date(),
            'jumlah' => $this->faker->numberBetween(1, 50),
            'keterangan' => $this->faker->sentence()
        ];
    }
}
