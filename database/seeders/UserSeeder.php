<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

use App\Models\User;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        User::create([
            'email' => 'holil.amd@gmail.com',
            'name' => 'Holil',
            'username' => 'Holil',
            'password' => \Hash::make('123456'),
        ]);
        User::create([
            'email' => 'admin@gmail.com',
            'name' => 'Admin',
            'username' => 'Admin',
            'password' => \Hash::make('123456'),
        ]);
        User::create([
            'email' => 'admin1@gmail.com',
            'name' => 'Admin1',
            'username' => 'Admin1',
            'password' => \Hash::make('123456'),
        ]);
    }
}
