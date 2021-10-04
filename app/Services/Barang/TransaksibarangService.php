<?php

namespace App\Services\Barang;

use Exception;
use Illuminate\Support\Facades\Validator;
use App\Repositories\Barang\TransaksiBarangRepository;
use Illuminate\Support\Facades\Auth;
use InvalidArgumentException;

class TransaksibarangService {

    protected $transaksiBarangRepository;

    public function __construct(TransaksiBarangRepository $transaksiBarangRepository)
    {
        $this->transaksiBarangRepository = $transaksiBarangRepository;

    }

    public function saveTrxitem($params){
        $val = Validator::make($params,[
            'jenistransaksi'    =>  'required',
        ]);
        if($val->failed()){
            throw new InvalidArgumentException($val->errors()->first());
        }
        if (count($params['detail']) === 0) {
            throw new InvalidArgumentException('Details tidak boleh kosong!');
        }

        $dt = $params;
        unset($dt['detail']);
        $dt['tgltransaksi'] = date('Y-m-d');
        $dt['created_by'] = Auth::user()->id;
        $dt['created_date'] = date('Y-m-d H:i:s');
        $dt['verifikasi_date'] = date('Y-m-d');
        $result = $this->transaksiBarangRepository->saveHeader($dt);
        $res['header'] = $result;
        $res['detail']= [];
        foreach ($params['detail'] as $i=> $data) {
            $data['transaksibarang_id'] = $result->id;
            if(empty($data['barang_id'])){
                throw new InvalidArgumentException('Details tidak boleh kosong!');
            }
            if(empty($data['cabang_id'])){
                throw new InvalidArgumentException('Kode cabang tidak boleh kosong!');
            }

            if(!isset($data['qty_in'])){
                $data['qty_in'] = 0.0;
            }

            if(!isset($data['qty_out'])){
                $data['qty_out'] = 0.0;
            }

            if($data['qty_in']+$data['qty_out'] ===0.0){
                throw new InvalidArgumentException('Details qty tidak boleh kosong!');
            }
            $restDetail = $this->transaksiBarangRepository->saveDetail($data);
            $res['detail'][$i] = $restDetail;
        }

        return $res;
    }
}
