<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserRating extends Model
{
    protected $table = 'user_rating';

    public function user()
    {
        return $this->belongsTo(User::class, 'users_id');
    }

    public function movie()
    {
        return $this->belongsTo(Movie::class, 'movie_id');
    }

    // ...
}