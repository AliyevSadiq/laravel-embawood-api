<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    public function register(Request $request){
        if($request->method()=='POST'){
			
            $validator=Validator::make($request->all(),User::$registerRules,User::$errorMsg);
            if($validator->fails()){
                return response()->json(['error' => true, 'messages' => $validator->errors()]);
            }
			
            User::create([
                'username'=>$request->input('username'),
                'email'=>$request->input('email'),
                'password'=>Hash::make($request->input('password'))
            ]);
            return response()->json('Siz qeydiyyatdan keçdiniz',200);
        }
    }

    public function login(Request $request){
        if($request->method()=='POST'){
		
            $validator=Validator::make($request->all(),User::$loginRules,User::$errorMsg);
            if($validator->fails()){
                return response()->json(['error' => true, 'messages' => $validator->errors()]);
            }
            if (!$token = auth()->attempt($request->all())) {
                return response()->json(['error' => true, 'messages' =>['wrong'=>'İstifadəçi adı və ya parol səhvdir']]);
            }
            return response()->json(['token' => $token]);
        }
    }

}
