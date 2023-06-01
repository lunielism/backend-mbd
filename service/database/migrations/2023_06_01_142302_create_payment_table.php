<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('payment', function (Blueprint $table) {
            $table->id();
            $table->date('payment_date');
            $table->decimal('total', 10, 2);
            $table->boolean('status');
            $table->unsignedBigInteger('subscription_id');
            $table->unsignedBigInteger('payment_method_id');
            $table->timestamps();

            $table->foreign('subscription_id')->references('id')->on('subscription');
            $table->foreign('payment_method_id')->references('id')->on('payment_method');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payment');
    }
};