<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('transactions', function (Blueprint $table) {
            $table->timestamp('canceled_at')->nullable()->after('status');
            $table->unsignedBigInteger('canceled_by')->nullable()->after('canceled_at');
            $table->timestamp('restored_at')->nullable()->after('canceled_by');
            $table->unsignedBigInteger('restored_by')->nullable()->after('restored_at');
        });
    }

    public function down(): void
    {
        Schema::table('transactions', function (Blueprint $table) {
            $table->dropColumn(['canceled_at', 'canceled_by', 'restored_at', 'restored_by']);
        });
    }
};