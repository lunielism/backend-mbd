<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class RegisterController extends Controller
{
    public function index()
    {
        return view('register.index', [
            'title' => 'Register'
        ]);
    }

    public function store(Request $request)
    {

        $validatedData = $request->validate([
            'nama' => 'required|string|max:255',
            'email' => 'required|email|unique:users',
            'password' => 'required|max:10',

        ]);


        User::create($validatedData);
        //$request->session()->flash('success', 'sign up success, please sign in');
        return redirect('/login')->with('success', 'sign up success, please sign in');
    }
}