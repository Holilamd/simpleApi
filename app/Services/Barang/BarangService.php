<?php
namespace App\Services\Barang;
use App\Repositories\Barang\BarangRepository;
use Illuminate\Support\Facades\Validator;
use App\Models\Barang\Barang;

use InvalidArgumentException;

class BarangService{

    protected $barangRepository;

    public function __construct(BarangRepository $barangRepository/*,Barang $entityName*/){

        $this->barangRepository = $barangRepository;
        // $this->entityName = $entityName;
    }

    public function getAll(){
        return $this->barangRepository->getAll();
    }

    public function saveData($data){
        $validate = Validator::make($data,[
            'kode_barang' => 'required|unique:barang',
            'nm_barang' => 'required',
            'satuan_id' => 'required',
            'supplier_id' => 'required',
            'merk_id' => 'required',
            'kategori_id' => 'required',
        ]);
        if($validate->fails()){
            throw new InvalidArgumentException($validate->errors()->first());
        }
        $result = $this->barangRepository->saveData($data);
        return $result;
    }



}
