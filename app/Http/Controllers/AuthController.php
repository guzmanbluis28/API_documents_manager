<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\DB;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $data = $request->validate([
            'username' => 'required',
            'password' => 'required',
        ]);

        $user = User::where('username', $data['username'])->first();

        if ($user) {
            if (Hash::check($data['password'], $user->password)) {
                if ($user->active == true) {
                    $token = $user->createToken("user_token");

                    return response()->json([
                        'msg' => $token->plainTextToken,
                    ], 200);
                } else {
                    throw ValidationException::withMessages([
                        'credentials' => ['Tu cuenta está inactiva.'],
                    ])->status(422);
                }
            }
        }

        throw ValidationException::withMessages([
            'credentials' => ['Credenciales incorrectas.'],
        ])->status(422);
    }

    public function register(Request $request)
    {
        $data = $request->validate([
            'name' => 'required',
            'username' => 'required|unique:users',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:8|confirmed',
        ]);

        DB::beginTransaction();

        try {
            $user = new User();
            $user->name = $data['name'];
            $user->username = $data['username'];
            $user->email = $data['email'];
            $user->password = Hash::make($data['password']);
            $user->save();

            DB::commit();

            return response()->json([
                'msg' => 'Registro exitoso.',
            ], 200);
        } catch (ValidationException $e) {
            DB::rollback();
            return response()->json($e->errors(), 422);
        } catch (\Exception $e) {
            DB::rollback();
            return response()->json([
                'msg' => 'Error al registrar el usuario.',
            ], 500);
        }
    }

    public function logout(Request $request)
    {
        $user = $request->user();
        $user->tokens()->delete();

        return response()->json([
            'msg' => 'Sesión finalizada.',
        ], 200);
    }
}
