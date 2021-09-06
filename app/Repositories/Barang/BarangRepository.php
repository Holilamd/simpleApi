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
                        'kode_barang'=> $data->kode_barang,
                        'nm_barang'=> $data->nm_barang,
                        'kategori'=> $data->kategori->name,
                        'satuan'=> $data->satuan->name,
                        'merk'=> $data->merk->name,
                        'supplier'=> $data->supplier->name,
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
