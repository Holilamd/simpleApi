<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\Auth\AuthController;
use App\Http\Controllers\Api\Barang\BarangController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::group(["prefix" =>"v1"], function(){
    Route::post('login',[AuthController::class,"login"]);

    Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
        return $request->user();
    });
    Route::middleware('auth:sanctum')->group( function(){
        Route::post('addUser', [AuthController::class,"addUser"]);
        Route::get('getAll', [BarangController::class,"index"]);
        Route::post('addBarang', [BarangController::class,"addBarang"]);
    });

});
