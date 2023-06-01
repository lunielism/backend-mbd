<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Genre;

class GenreController extends Controller
{
    public function index()
    {
        $genres = Genre::all();
        return view('genre', compact('genres'));
    }
    public function show($id)
    {
        $genres = Genre::find($id);
        if (!$genres) {
            abort(404); // Tampilkan halaman error 404 jika film tidak ditemukan
        }

        return view('genre', compact('genres'));
    }

    public function showMoviesByGenre($genreId)
    {
        $genre = Genre::findOrFail($genreId);
        $movies = $genre->movies;

        return view('movies.genre', compact('genre', 'movies'));
    }
}