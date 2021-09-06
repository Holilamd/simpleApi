<?php

namespace App\Models\Barang;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Supplier extends Model
{
    use HasFactory;
    protected $table = "supplier";


    // public function dsupplier(){
    //     return $this->hasMany('App\Models\Barang\Barang');
    // }

}
