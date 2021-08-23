<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTransaksibarangdetailTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transaksibarangdetail', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('transaksibarang_id')->unsigned();
            $table->foreign('transaksibarang_id')->references('id')->on('transaksibarang');
            $table->integer('barang_id')->unsigned();
            $table->foreign('barang_id')->references('id')->on('barang');
            $table->float('qty_out',12,0)->default(0);
            $table->float('qty_in',12,0)->default(0);
            $table->float('harga',12,0)->default(0);
            $table->integer('cabang_id')->unsigned();
            $table->foreign('cabang_id')->references('id')->on('cabang');
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
        Schema::dropIfExists('transaksibarangdetail');
    }
}
