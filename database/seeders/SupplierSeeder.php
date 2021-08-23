<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Barang\Supplier;


class SupplierSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i=0; $i<5; $i++){
            Supplier::create([
                'name' => 'Supplier '. $i,
                'alamat' => 'Keterangan Supplier'. $i,
            ]);
        }
    }
}
