<?php

namespace App\Models;

use App\Models\Movie;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Genre extends Model
{
    protected $table = 'genre';
    protected $primaryKey = 'id';
    public $timestamps = false;

    // Relationship
    public function movies()
    {
        return $this->hasMany(Movie::class, 'genre_id');
    }
}