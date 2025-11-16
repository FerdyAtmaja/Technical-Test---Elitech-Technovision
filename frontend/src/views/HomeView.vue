<template>
  <div class="min-h-screen bg-gray-50 p-6">
    <!-- Header -->
    <div class="mb-8">
      <h1 class="text-3xl font-bold text-gray-900 mb-2">Dashboard</h1>
      <p class="text-gray-600">Selamat datang di Sistem Manajemen Inventori</p>
    </div>

    <!-- Summary Cards -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
      <!-- Total Items -->
      <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6 hover:shadow-md transition-shadow">
        <div class="flex items-center justify-between">
          <div>
            <p class="text-sm font-medium text-gray-600">Total Barang</p>
            <p class="text-3xl font-bold text-gray-900">{{ stats.totalItems }}</p>
          </div>
          <div class="bg-blue-100 p-3 rounded-full">
            <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"/>
            </svg>
          </div>
        </div>
      </div>

      <!-- Total Stock -->
      <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6 hover:shadow-md transition-shadow">
        <div class="flex items-center justify-between">
          <div>
            <p class="text-sm font-medium text-gray-600">Total Stok</p>
            <p class="text-3xl font-bold text-gray-900">{{ stats.totalStock }}</p>
          </div>
          <div class="bg-green-100 p-3 rounded-full">
            <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"/>
            </svg>
          </div>
        </div>
      </div>

      <!-- Transactions Today -->
      <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6 hover:shadow-md transition-shadow">
        <div class="flex items-center justify-between">
          <div>
            <p class="text-sm font-medium text-gray-600">Transaksi Hari Ini</p>
            <p class="text-3xl font-bold text-gray-900">{{ stats.todayTransactions }}</p>
          </div>
          <div class="bg-purple-100 p-3 rounded-full">
            <svg class="w-6 h-6 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v10a2 2 0 002 2h8a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/>
            </svg>
          </div>
        </div>
      </div>

      <!-- Low Stock Alert -->
      <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6 hover:shadow-md transition-shadow">
        <div class="flex items-center justify-between">
          <div>
            <p class="text-sm font-medium text-gray-600">Stok Menipis</p>
            <p class="text-3xl font-bold text-red-600">{{ stats.lowStockCount }}</p>
          </div>
          <div class="bg-red-100 p-3 rounded-full">
            <svg class="w-6 h-6 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L4.082 16.5c-.77.833.192 2.5 1.732 2.5z"/>
            </svg>
          </div>
        </div>
      </div>
    </div>

    <!-- Main Content Grid -->
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
      <!-- Low Stock List -->
      <div class="lg:col-span-2">
        <div class="bg-white rounded-xl shadow-sm border border-gray-200">
          <div class="p-6 border-b border-gray-200">
            <div class="flex items-center justify-between">
              <h2 class="text-xl font-semibold text-gray-900">Barang Stok Menipis</h2>
              <span class="bg-red-100 text-red-800 text-xs font-medium px-2.5 py-0.5 rounded-full">
                {{ lowStockItems.length }} Item
              </span>
            </div>
          </div>
          <div class="p-6">
            <div v-if="lowStockItems.length === 0" class="text-center py-8">
              <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
              </svg>
              <p class="mt-2 text-sm text-gray-500">Semua barang memiliki stok yang cukup</p>
            </div>
            <div v-else class="space-y-4">
              <div v-for="item in lowStockItems" :key="item.id" 
                   class="flex items-center justify-between p-4 bg-red-50 rounded-lg border border-red-200">
                <div class="flex-1">
                  <h3 class="font-medium text-gray-900">{{ item.nama_barang }}</h3>
                  <p class="text-sm text-gray-600">{{ item.kode_barang }}</p>
                </div>
                <div class="text-right">
                  <p class="text-lg font-bold text-red-600">{{ item.stock }}</p>
                  <p class="text-xs text-gray-500">{{ item.satuan }}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Recent Activity -->
      <div class="lg:col-span-1">
        <div class="bg-white rounded-xl shadow-sm border border-gray-200">
          <div class="p-6 border-b border-gray-200">
            <h2 class="text-xl font-semibold text-gray-900">Aktivitas Terbaru</h2>
          </div>
          <div class="p-6">
            <div v-if="recentTransactions.length === 0" class="text-center py-8">
              <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v10a2 2 0 002 2h8a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/>
              </svg>
              <p class="mt-2 text-sm text-gray-500">Belum ada transaksi</p>
            </div>
            <div v-else class="space-y-4">
              <div v-for="transaction in recentTransactions" :key="transaction.id" 
                   class="flex items-start space-x-3">
                <div class="flex-shrink-0">
                  <div :class="{
                    'bg-green-100 text-green-600': transaction.jenis_transaksi === 'masuk',
                    'bg-red-100 text-red-600': transaction.jenis_transaksi === 'keluar'
                  }" class="w-8 h-8 rounded-full flex items-center justify-center">
                    <svg v-if="transaction.jenis_transaksi === 'masuk'" class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"/>
                    </svg>
                    <svg v-else class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 12H4"/>
                    </svg>
                  </div>
                </div>
                <div class="flex-1 min-w-0">
                  <p class="text-sm font-medium text-gray-900">
                    {{ transaction.item.nama_barang }}
                  </p>
                  <p class="text-xs text-gray-500">
                    {{ transaction.jenis_transaksi === 'masuk' ? 'Barang Masuk' : 'Barang Keluar' }} 
                    • {{ transaction.jumlah }} {{ transaction.item.satuan }}
                  </p>
                  <p class="text-xs text-gray-400">{{ formatDate(transaction.tanggal_transaksi) }}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import itemService from '@/services/itemService'
import transactionService from '@/services/transactionService'

export default {
  name: 'HomeView',
  data() {
    return {
      stats: {
        totalItems: 0,
        totalStock: 0,
        todayTransactions: 0,
        lowStockCount: 0
      },
      lowStockItems: [],
      recentTransactions: [],
      loading: true
    }
  },
  async mounted() {
    await this.loadDashboardData()
  },
  methods: {
    async loadDashboardData() {
      try {
        this.loading = true
        
        // Load all data in parallel
        const [itemsResponse, transactionsResponse] = await Promise.all([
          itemService.getAll(),
          transactionService.getAll({ limit: 10 })
        ])
        
        const items = itemsResponse.data.data || itemsResponse.data
        const transactions = transactionsResponse.data.data || transactionsResponse.data
        
        // Calculate stats
        this.stats.totalItems = items.length
        this.stats.totalStock = items.reduce((sum, item) => sum + (item.stock || 0), 0)
        
        // Today's transactions
        const today = new Date().toISOString().split('T')[0]
        this.stats.todayTransactions = transactions.filter(t => 
          t.tanggal_transaksi === today
        ).length
        
        // Low stock items (stock <= 10) - menggunakan field stock, bukan stock_awal
        this.lowStockItems = items.filter(item => (item.stock || 0) <= 10)
        this.stats.lowStockCount = this.lowStockItems.length
        
        // Recent transactions
        this.recentTransactions = transactions.slice(0, 8)
        
      } catch (error) {
        console.error('Error loading dashboard data:', error)
      } finally {
        this.loading = false
      }
    },
    
    formatDate(dateString) {
      const date = new Date(dateString)
      const now = new Date()
      const diffTime = Math.abs(now - date)
      const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24))
      
      if (diffDays === 1) return 'Hari ini'
      if (diffDays === 2) return 'Kemarin'
      if (diffDays <= 7) return `${diffDays - 1} hari lalu`
      
      return date.toLocaleDateString('id-ID', {
        day: 'numeric',
        month: 'short',
        year: 'numeric'
      })
    }
  }
}
</script>