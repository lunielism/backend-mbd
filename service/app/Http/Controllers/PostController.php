<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post;

class PostController extends Controller
{
    public function home()
    {

        return view('home', [
            'title' => 'Home',
            'active' => 'Home'
        ]);
    }
    public function index()
    {
        
        return view('movies.index', [
            "title" => "All Movie",
            "active" => 'movie',
            ]);
    }

}