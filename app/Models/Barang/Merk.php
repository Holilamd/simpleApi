<?php

namespace App\Models\Barang;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Merk extends Model
{
    use HasFactory;
    protected $table = "merk";
    protected $primaryKey = "id";
    protected $fillable = ["id","name","description"];

    public function dmerk(){
        return $this->hasMany('App\Models\Barang\Barang');
    }
}
