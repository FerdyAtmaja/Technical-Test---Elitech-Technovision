<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    public function run(): void
    {
        $users = [
            [
                'name' => 'Administrator',
                'email' => 'admin@inventory.com',
                'password' => Hash::make('admin123'),
                'role' => 'admin'
            ],
            [
                'name' => 'Manager',
                'email' => 'manager@inventory.com', 
                'password' => Hash::make('manager123'),
                'role' => 'manager'
            ],
            [
                'name' => 'Staff',
                'email' => 'staff@inventory.com',
                'password' => Hash::make('staff123'),
                'role' => 'staff'
            ]
        ];

        foreach ($users as $userData) {
            if (!User::where('email', $userData['email'])->exists()) {
                User::create($userData);
            }
        }
    }
}