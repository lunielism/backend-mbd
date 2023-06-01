<?php

namespace App\Models;

use App\Models\Movie;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class MovieStatus extends Model
{
    protected $table = 'movie_status';
    protected $primaryKey = 'id';
    public $timestamps = false;

    // Relationship
    public function movies()
    {
        return $this->hasMany(Movie::class, 'movie_status_id');
    }
}