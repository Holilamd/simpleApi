<?php

namespace App\Models\Barang;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kategori extends Model
{
    use HasFactory;
    protected $table = "kategori";
    protected $primaryKey = "id";
    protected $fillable = ["id","name","description"];

    public function dkategori(){
        return $this->hasMany('App\Models\Barang\Barang');
    }
}
