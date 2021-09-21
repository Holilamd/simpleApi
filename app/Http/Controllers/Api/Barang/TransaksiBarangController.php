<?php

namespace App\Http\Controllers\Api\Barang;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\Barang\TransaksibarangService;
use Exception;
use Illuminate\Support\Facades\DB;


class TransaksiBarangController extends Controller
{
    private $trxItemService;

    public function __construct(Transaksibarangservice $trxItemService)
    {
        $this->trxItemService = $trxItemService;
    }

    public function saveTransaksi(Request $request)
    {
       DB::beginTransaction();
        try {
            $result  = $this->trxItemService->saveTrxitem($request->all());
            DB::commit();
            return $this->successResponse($result,'Success');
        } catch (\Exception $e) {
            DB::rollBack();
            return $this->errorResponse($e->getMessage(),501);
        }
    }
}
