<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTransaksibarangTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transaksibarang', function (Blueprint $table) {
            $table->increments('id');
            $table->date('tgltransaksi');
            $table->string('jenistransaksi');
            $table->string('noref')->nullable();
            $table->string('keterangan')->nullable();
            $table->string('created_by');
            $table->date('created_date');
            $table->string('verifikasi_by')->nullable();
            $table->date('verifikasi_date');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('transaksibarang');
    }
}
