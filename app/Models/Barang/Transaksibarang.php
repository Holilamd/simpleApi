<?php

namespace App\Models\Barang;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaksibarang extends Model
{
    use HasFactory;
    protected $table = "transaksibarang";
    protected $primaryKey = "id";
    protected $fillable = ["id","tgltransaksi",
                            "jenistransaksi","noref",
                            "keterangan","created_by",
                            "created_date","verifikasi_by",
                            "verifikasi_date"];

}
