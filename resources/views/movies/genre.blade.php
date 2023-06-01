@extends('layouts.main')

@section('container')
    <div class="container">
        <h1>Film dengan Genre: {{ $genre->nama }}</h1>

        <div class="row">
            @forelse ($movies as $movie)
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="https://source.unsplash.com/1200x490/?{{ $movie->nama }}" class="card-img-top" alt="{{ $movie->nama }}">
                        <div class="card-body">
                            <h5 class="card-title">{{ $movie->nama }}</h5>
                            <p class="card-text">{{ $movie->deskripsi }}</p>
                            <a href="{{ route('movies.show', $movie->id) }}" class="btn btn-primary">Lihat Detail</a>
                        </div>
                    </div>
                </div>
            @empty
                <div class="col">
                    <p>Tidak ada film yang tersedia untuk genre ini.</p>
                </div>
            @endforelse
        </div>
    </div>
@endsection
