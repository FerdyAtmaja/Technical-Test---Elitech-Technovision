<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('transactions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('item_id')->constrained('items')->onDelete('cascade');
            $table->enum('jenis_transaksi', ['masuk', 'keluar']);
            $table->date('tanggal_transaksi');
            $table->integer('jumlah');
            $table->text('keterangan')->nullable();
            $table->enum('status', ['aktif', 'dibatalkan', 'restored'])->default('aktif');
            $table->timestamp('canceled_at')->nullable();
            $table->unsignedBigInteger('canceled_by')->nullable();
            $table->timestamp('restored_at')->nullable();
            $table->unsignedBigInteger('restored_by')->nullable();
            $table->integer('lock_version')->default(0);
            $table->timestamps();
            $table->softDeletes();
            
            $table->foreign('canceled_by')->references('id')->on('users');
            $table->foreign('restored_by')->references('id')->on('users');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('transactions');
    }
};