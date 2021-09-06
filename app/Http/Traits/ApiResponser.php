<?php

namespace App\Http\Traits;

trait  ApiResponser{

    protected function successResponse($data, $message = null, $code = 200){
		return response()->json([
			'success'=> 'Success', 
			'status_code' => $code,
			'message' => $message, 
			'data' => $data
		], $code);
	}

	protected function errorResponse($message = null,$code=401){
		return response()->json([
			'status'=>'Error',
			'status_code' => $code,
			'message' => $message,
			'data' => null
		],$code);
	}
	protected function generalResponse($status,$data,$message = null,$code=401){
		return response()->json([
			'status'=>$status,
			'status_code' => $code,
			'message' => $message,
			'data' =>$data
		],$code);
	}
	protected function successResponseHdetail($header,$detail, $message = null, $code = 200){

	}


}