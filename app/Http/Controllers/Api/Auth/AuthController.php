<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Arr;
use App\Models\User;


use App\Services\CreateAuthService;
use App\Http\Requests\CreateAuthRequest;

class AuthController extends Controller
{
    public function login(Request $request){
        $request['username']  = $request['username'];
        $validate = \Validator::make($request->all(),[
            'username' => 'required',
            'password' => 'required',
        ]);
        if($validate->fails()){
            $respon = [
                'status' => 'error',
                'msg' => 'Validator error',
                'errors' => $validate->errors(),
                'data' => null,
            ];
            return response()->json($respon, 200);
        }else{
            $credentials = request(['username', 'password']);
            $credentials = Arr::add($credentials, 'status', 'Aktif');
            if (!Auth::attempt($credentials)) {
                $respon = [
                    'status' => 'error',
                    'msg' => 'Unathorized',
                    'errors' => null,
                    'data' => null,
                ];
                return response()->json($respon, 401);
            }
            $user = User::where('username', $request->username)->first();
            if (! \Hash::check($request->password, $user->password, [])) {
                throw new \Exception('Error in Login');
            }

            $tokenResult = $user->createToken('token-auth')->plainTextToken;
            $respon = [
                'status' => 'success',
                'msg' => 'Login successfully',
                'errors' => null,
                'status_code' => 200,
                
            ];
            return response()->json($respon, 200);
        }
    }
   
    public function addUser(Request $request){
        $validate = \Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'username' => 'required|unique:users',
            'password' => 'required',
        ]);
        if ($validate->fails()) {
            $respon = [
                'status' => 'error',
                'msg' => 'Validator error',
                'errors' => $validate->errors(),
                'data' => null,
            ];
            return response()->json($respon, 200);
        } else {
            $tmp['id'] = User::where('username',$request['username'])->first();
            if($tmp['id']){
                DB::rollback();
                return $this->errorResponse('Username  '.$request['username'].' already',501);
            }
            DB::beginTransaction();
            try{
                $request['password'] = \Hash::make($request['password']);
                $request['status'] = 'Aktif';
                $post = User::create($request->all());
                DB::commit();
                return $this->successResponse($post,'Success');
            }catch(\Exception $e){
                DB::rollback();
                return $this->errorResponse('Something Went Wrong! '.$e,501);
            }
        }
    }
}
