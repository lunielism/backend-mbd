<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Movie extends Model
{
    protected $table = 'movie';

    protected $fillable = [
        'nama',
        'tahun_rilis',
        'deskripsi',
        'resolusi',
        'durasi',
        'director',
        'studio_produksi',
        'genre_id',
        'rating_umur_id',
        'movie_status_id',
    ];

    public function genre()
    {
        return $this->belongsTo(Genre::class);
    }

    public function rating_umur()
    {
        return $this->belongsTo(RatingUmur::class);
    }

    public function movie_status()
    {
        return $this->belongsTo(MovieStatus::class);
    }
}