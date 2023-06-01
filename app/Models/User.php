<?php

namespace App\Models;

use App\Models\Like;
use App\Models\Bookmark;
use App\Models\UserRating;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $guarded = ['id'];

    protected $fillable = [
        'nama',
        'email',
        'password',
    ];

    public function ratings()
    {
        return $this->hasMany(UserRating::class, 'users_id');
    }

    public function bookmarks()
    {
        return $this->hasMany(Bookmark::class, 'users_id');
    }

    public function likes()
    {
        return $this->hasMany(Like::class, 'users_id');
    }

    public function comments()
    {
        return $this->hasMany(Comment::class, 'users_id');
    }

    public function subscriptions()
    {
        return $this->hasMany(Subscription::class, 'users_id');
    }

    // ...
}