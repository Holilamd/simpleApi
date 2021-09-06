<?php
namespace App\Repositories\Barang;

use App\Models\Barang\Barang;
use App\Models\Barang\Kategori;



class BarangRepository {

    protected $entityBarang;

    public function __construct(Barang $entityBarang){

        $this->entityBarang = $entityBarang;
    }

    public function getAll(){
        $data = $this->entityBarang::get()
                ->map(function($data){
                    return[
                        'name'=> $data->name
                    ];
                });
        return $data;
    }

    public function saveData($data){
        $post = $this->entityBarang::create($data);
        return $post->fresh();
    }

    public function getData($params,$field){
        return $this->entityName::where($field,$params)->first();
    }
}
