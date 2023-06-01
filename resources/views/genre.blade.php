<!-- genres/index.blade.php -->

@extends('layouts.main')

@section('container')
    <div class="container">
        <h1>Genre Movie</h1>
        <ul>
            @foreach ($genres as $genre)
                <li><a href="/movies/genre/{{ $genre->id }}">{{ $genre->nama }}</a></li>
            @endforeach
        </ul>
    </div>
@endsection
