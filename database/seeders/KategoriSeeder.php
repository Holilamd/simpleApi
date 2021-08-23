<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Barang\kategori;

class KategoriSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
       
        for ($i=0; $i<5; $i++){
            Kategori::create([
                'name' => 'Keperluan '. $i,
                'description' => 'Keterangan '. $i,
            ]);
        }
        
    }
}
