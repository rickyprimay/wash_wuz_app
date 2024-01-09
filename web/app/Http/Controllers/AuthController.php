<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Facades\JWTAuth;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:8',
            'address' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        $user = \App\Models\User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'address' => $request->address,
            'role' => '1', // Default role 
        ]);

        return response()->json(['user' => $user], 201);
    }

    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            $token = JWTAuth::fromUser($user);

            switch ($user->role) {
                case 1:
                    return response()->json(['user' => $user, 'access_token' => $token], 200);
                case 2:
                    return response()->json(['user' => $user, 'access_token' => $token], 200);
                case 3:
                    return response()->json(['user' => $user, 'access_token' => $token], 200);
                default:
                    return response()->json(['error' => 'Invalid role'], 401);
            }
        } else {
            return response()->json(['error' => 'Unauthorized'], 401);
        }
    }
}