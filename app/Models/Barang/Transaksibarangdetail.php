<?php

namespace App\Models\Barang;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaksibarangdetail extends Model
{
    use HasFactory;
    protected $table = "transaksibarangdetail";
    protected $primaryKey = "id";
    protected $fillable = ["id","transaksibarang_id",
                            "barang_id","qty_out",
                            "qty_in","harga",
                            "cabang_id"];
}
