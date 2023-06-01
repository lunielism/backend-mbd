@extends('layouts\main')

@section('container')
    <div class="container">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <h1>Movie List</h1>
                <hr>
                @foreach ($movies as $movie)
                    <div class="card mb-4">
                        <div class="card-body">
                            <img src="https://source.unsplash.com/1200x490/?{{ $movie->nama }}" class="card-img-top" alt="{{ $movie->nama }}">

                            <h5 class="card-title" href="/movies/{{ $movie->id }}"><a href="/movies/{{ $movie->id }}">{{ $movie->nama }}</a></h5>
                            <p>Genre: <a href="movies/genre/{{ $movie->genre->id }}">{{ $movie->genre->nama }}</a>
                                | Director: <a href="/movies/{{ $movie->id }}">{{ $movie->director }}</a>
                            </p>
                            
                            <p class="card-text">{{ $movie->deskripsi }}</p>
                            <a href="/movies/{{ $movie->id }}" class="btn btn-primary">Read More</a>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
@endsection

