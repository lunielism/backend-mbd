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
    public function about()
    {
        return view('about', [
            'title' => 'About',
            'active' => 'about',
            'name' => 'Rule lulu',
            'email' => 'rule@gmail'
        ]);
    }
    public function index()
    {

        return view('posts', [
            "title" => "All Post",
            "active" => 'posts',
            //"posts" => Post::all(),
            "posts" => Post::latest()->filter(request(['find', 'category']))->get()
        ]);
    }

    public function Show($slug)
    {
        return view('post', [
            "title" => "post",
            "post" => Post::find($slug)

        ]);
    }
}