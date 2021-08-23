<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Barang\Merk;


class MerkSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i=0; $i<5; $i++){
            Merk::create([
                'name' => 'Merk '. $i,
                'description' => 'Keterangan '. $i,
            ]);
        }
    }
}
