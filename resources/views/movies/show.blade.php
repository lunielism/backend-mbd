<!-- movies/show.blade.php -->

@extends('layouts.main')

@section('container')
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2>{{ $movie->nama }}</h2>
            </div>
            <div class="card-body">
                <p>Tahun Rilis: {{ $movie->tahun_rilis }}</p>
                <p>Deskripsi: {{ $movie->deskripsi }}</p>
                <p>Resolusi: {{ $movie->resolusi }}</p>
                <p>Durasi: {{ $movie->durasi }}</p>
                <p>Director: {{ $movie->director }}</p>
                <p>Studio Produksi: {{ $movie->studio_produksi }}</p>
                <p>Genre: {{ $movie->genre->nama }}</p>
                <p>Rating Umur: {{ $movie->rating_umur->rate }}</p>
                <p>Status: {{ $movie->movie_status->jenis }}</p>
            </div>
        </div>
        <a href="/movies">Back</a>
    </div>
@endsection
