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
        Schema::create('movie', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->string('nama', 50);
            $table->date('tahun_rilis');
            $table->string('deskripsi', 1000);
            $table->integer('resolusi');
            $table->string('durasi');
            $table->string('director', 100);
            $table->string('studio_produksi', 100);
            $table->integer('genre_id');
            $table->integer('rating_umur_id');
            $table->integer('movie_status_id');
            $table->foreign('genre_id')->references('id')->on('genre');
            $table->foreign('rating_umur_id')->references('id')->on('rating_umur');
            $table->foreign('movie_status_id')->references('id')->on('movie_status');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('movie');
    }
};