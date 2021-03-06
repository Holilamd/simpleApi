<?php

namespace App\Models\Barang;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Barang extends Model
{
    use HasFactory;
    protected $table = "barang";
    protected $primaryKey = "id";
    protected $fillable = ["id","kode_barang","nm_barang",
                            "satuan_id"	,"supplier_id",
                            "merk_id","kategori_id"
                            ];

    public function kategori(){
        return $this->belongsTo('App\Models\Barang\Kategori');
    }
    public function merk(){
        return $this->belongsTo('App\Models\Barang\Merk');
    }
    public function satuan(){
        return $this->belongsTo('App\Models\Barang\Satuan');
    }
    public function supplier(){
        return $this->belongsTo('App\Models\Barang\Supplier');
    }
}
