<?php


use App\Http\Controllers\ProductController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::get('/',[ProductController::class,'index']);
Route::get('/category',[ProductController::class,'category']);
Route::get('/edit/{id?}',[ProductController::class,'edit'])->middleware('product');




Route::group(['middleware'=>'jwt.verify'],function (){
    Route::post('/update/{id}',[ProductController::class,'update'])->middleware('product');
    Route::delete('/delete/{id}',[ProductController::class,'delete'])->middleware('product');
    Route::post('/create',[ProductController::class,'create']);
});

Route::post('/register',[UserController::class,'register']);
Route::post('/login',[UserController::class,'login']);

