<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RatingUmur extends Model
{
    protected $table = 'rating_umur';
    protected $primaryKey = 'id';
    public $timestamps = false;

    // Relationship
    public function movies()
    {
        return $this->hasMany(Movie::class, 'rating_umur_id');
    }
}