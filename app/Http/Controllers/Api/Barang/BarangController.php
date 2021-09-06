<?php

namespace App\Http\Controllers\Api\Barang;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\Barang\BarangService;
use Illuminate\Support\Facades\DB;
use Exception;


class BarangController extends Controller
{
    private $barangService;

    public function __construct(BarangService $barangService)
    {
        $this->barangService = $barangService;
    }

    public function index(){

        try{
            $data  = $this->barangService->getAll();
            $result = $this->successResponse($data,'Success');

        } catch(Exception $ex){
            $result = $this->errorResponse($ex->getMessage(),500);
        }
        return $result;

    }
    public function addBarang(Request $request){
        DB::beginTransaction();
        try{
            $data = $this->barangService->saveData($request->all());
            DB::commit();
            return $this->successResponse($data,'Success');
        }catch(\Exception $e){
            DB::rollBack();
            return $this->errorResponse($e->getMessage(),501);
        }
    }

    public function updateBarang(){

    }

    public function deleteBarang(){

    }
}
