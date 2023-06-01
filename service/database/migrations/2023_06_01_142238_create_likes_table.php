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
        Schema::create('likes', function (Blueprint $table) {
            $table->id();
            $table->string('like_status', 10);
            $table->unsignedBigInteger('users_id');
            $table->unsignedBigInteger('movie_id');
            $table->timestamps();

            $table->foreign('users_id')->references('id')->on('users');
            $table->foreign('movie_id')->references('id')->on('movie');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('likes');
    }
};