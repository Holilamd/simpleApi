<?php
namespace App\Repositories\Barang;

use App\Models\Barang\Transaksibarang;
use App\Models\Barang\Transaksibarangdetail;

class TransaksiBarangRepository {
    protected $headerTransaksi;
    protected $detailTransaksi;

    public function __construct(Transaksibarang $headerTransaksi, Transaksibarangdetail $detailTransaksi)
    {
        $this->headerTransaksi = $headerTransaksi;
        $this->detailTransaksi = $detailTransaksi;

    }
    public function saveHeader($data){
        $post = $this->headerTransaksi::create($data);
        return $post;
    }
    public function saveDetail($data){
        $detail = $this->detailTransaksi::create($data);
        return $detail;

    }

}
