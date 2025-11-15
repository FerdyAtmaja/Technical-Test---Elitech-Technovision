<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class ItemFactory extends Factory
{
    public function definition(): array
    {
        return [
            'kode_barang' => 'BRG-' . str_pad($this->faker->unique()->numberBetween(1, 999), 3, '0', STR_PAD_LEFT),
            'nama_barang' => $this->faker->words(2, true),
            'satuan' => $this->faker->randomElement(['pcs', 'box', 'kg', 'liter']),
            'stock' => $this->faker->numberBetween(0, 100)
        ];
    }
}
