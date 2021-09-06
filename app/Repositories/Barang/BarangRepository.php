<?php
namespace App\Repositories\Barang;

use App\Models\Barang\Barang;
use App\Models\Barang\Kategori;



class BarangRepository {

    protected $masterBarang;

    public function __construct(Barang $masterBarang){

        $this->masterBarang = $masterBarang;
    }

    public function getAll(){
        $data = $this->masterBarang::get()
                ->map(function($data){
                    return[
                        'name'=> $data->name
                    ];
                });
        return $data;
    }

    public function saveData($data){
        // return var_dump($data);
        $post = $this->masterBarang::create($data);
        return $post->fresh();
    }
}
