<?php
namespace App\Services\Barang;
use App\Repositories\Barang\BarangRepository;
use Illuminate\Support\Facades\Validator;
use App\Models\Barang\Barang;

use InvalidArgumentException;

class BarangService{

    protected $barangRepository;

    public function __construct(BarangRepository $barangRepository){

        $this->barangRepository = $barangRepository;
    }

    public function getAll(){
        return $this->barangRepository->getAll();
    }

    public function saveData($data){
        $validate = Validator::make($data,[
            'kode_barang' => 'required',
            'nm_barang' => 'required',
            'satuan_id' => 'required',
            'supplier_id' => 'required',
            'merk_id' => 'required',
            'kategori_id' => 'required',
        ]);
        if($validate->fails()){
            throw new InvalidArgumentException($validate->errors()->first());
        }
        $tmp['id'] = Barang::where('kode_barang',$data['kode_barang'])->first();
        if($tmp['id']){
            throw new \InvalidArgumentException('Kode Barang '.$data['kode_barang'].' already',501);
        }
        $result = $this->barangRepository->saveData($data);
        return $result;
    }

}
