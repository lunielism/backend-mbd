<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\PostController;
use App\Http\Controllers\GenreController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\MovieController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\AdminCategoryController;
use App\Http\Controllers\DashboardPostController;



/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/


Route::get('/', [PostController::class, 'home']);

Route::get('/movies', [MovieController::class, 'index']);

Route::get('/genres', [GenreController::class, 'index'])->name('genres.index');

Route::get('/movies/{movie}', [MovieController::class, 'show'])->name('movies.show');

Route::get('/movies/genre/{genre}', [MovieController::class, 'showByGenre'])->name('movies.byGenre');

Route::get('/login', [LoginController::class, 'index']);

Route::post('/login', [LoginController::class, 'authenticate']);

Route::post('/logout', [LoginController::class, 'logout']);

Route::get('/register', [RegisterController::class, 'index']);

Route::post('/register', [RegisterController::class, 'store']);

Route::get('/dashboard', function () {
    return view('dashboard.index');
});

Route::get('/dashboard/posts/checkSlug', [DashboardPostController::class, 'checkSlug']);

Route::resource('/dashboard/movies', DashboardPostController::class);

Route::resource('/dashboard/categories', AdminCategoryController::class)->except('show');