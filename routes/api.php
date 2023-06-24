<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\DocumentoController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Rutas de autenticación
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');

// Rutas del CRUD de documentos
Route::middleware(['auth:sanctum'])->group(function () {
    Route::get('/documentos', [DocumentoController::class, 'index']);
    Route::post('/documentos', [DocumentoController::class, 'store']);
    Route::get('/documentos/{id}', [DocumentoController::class, 'show']);
    Route::put('/documentos/{id}', [DocumentoController::class, 'update']);
    Route::delete('/documentos/{id}', [DocumentoController::class, 'destroy']);
    Route::get('/tipos-documentos', [DocumentoController::class, 'getTiposDocumentos']);
    Route::get('/procesos-documentos', [DocumentoController::class, 'getProcesosDocumentos']);
});
