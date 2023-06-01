<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PaymentMethod extends Model
{
    protected $table = 'payment_method';
    protected $primaryKey = 'id';
    public $timestamps = false;

    // Relationship
    public function payments()
    {
        return $this->hasMany(Payment::class, 'payment_method_id');
    }
}