<?php

namespace App\Models\Barang;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Satuan extends Model
{
    use HasFactory;

    protected $table = "satuan";
    protected $primaryKey = "id";
    protected $fillable = ["id","name","status"];

    public function dsatuan(){
        return $this->hasMany('App\Models\Barang\Barang');
    }

}
