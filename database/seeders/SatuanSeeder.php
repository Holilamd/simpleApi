<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Barang\Satuan;

class SatuanSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Satuan::create([
            'name' => 'Kg ',
            // 'description' => 'Kilogram '
        ]);
        Satuan::create([
            'name' => 'Gr ',
            // 'description' => 'Gram '
        ]);
        Satuan::create([
            'name' => 'Ml ',
            // 'description' => 'Miligram '
        ]);
    }
}
