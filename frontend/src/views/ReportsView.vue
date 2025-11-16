<template>
  <div class="p-6">
    <div class="mb-6">
      <h1 class="text-2xl font-bold text-gray-900 mb-4">Laporan Stok</h1>
      
      <!-- Filter Section -->
      <div class="bg-white rounded-lg shadow p-4 mb-6">
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
          <div>
            <label class="block text-sm font-medium mb-2">Pencarian</label>
            <input 
              v-model="filters.search"
              @input="debounceSearch"
              type="text" 
              placeholder="Cari kode/nama barang..."
              class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
          </div>
          
          <div>
            <label class="block text-sm font-medium mb-2">Tanggal Mulai</label>
            <input 
              v-model="filters.start_date"
              @change="fetchReport"
              type="date" 
              class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
          </div>
          
          <div>
            <label class="block text-sm font-medium mb-2">Tanggal Akhir</label>
            <input 
              v-model="filters.end_date"
              @change="fetchReport"
              type="date" 
              class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
          </div>
          
          <div>
            <label class="block text-sm font-medium mb-2">Satuan</label>
            <select 
              v-model="filters.satuan"
              @change="fetchReport"
              class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
              <option value="">Semua Satuan</option>
              <option v-for="unit in availableUnits" :key="unit" :value="unit">
                {{ unit }}
              </option>
            </select>
          </div>
        </div>
        
        <div class="flex justify-end mt-4">
          <button 
            @click="resetFilters"
            class="px-4 py-2 text-gray-600 border border-gray-300 rounded-md hover:bg-gray-50"
          >
            Reset Filter
          </button>
        </div>
      </div>
    </div>

    <!-- Table Section -->
    <div class="bg-white rounded-lg shadow overflow-hidden">
      <div class="p-4 border-b border-gray-200 flex justify-between items-center">
        <div class="flex items-center gap-2">
          <span class="text-sm text-gray-700">Tampilkan</span>
          <select 
            v-model="pagination.per_page" 
            @change="changePerPage($event.target.value)"
            class="border border-gray-300 rounded px-2 py-1 text-sm"
          >
            <option value="10">10</option>
            <option value="25">25</option>
            <option value="50">50</option>
            <option value="100">100</option>
          </select>
          <span class="text-sm text-gray-700">data</span>
        </div>
        <div class="text-sm text-gray-700">
          Menampilkan {{ (pagination.current_page - 1) * pagination.per_page + 1 }} - 
          {{ Math.min(pagination.current_page * pagination.per_page, pagination.total) }} 
          dari {{ pagination.total }} data
        </div>
      </div>
      
      <div class="overflow-x-auto">
        <table class="min-w-full divide-y divide-gray-200">
          <thead class="bg-gray-50">
            <tr>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">No</th>
              <th 
                @click="sortBy('kode_barang')"
                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider cursor-pointer hover:bg-gray-100 select-none"
              >
                <div class="flex items-center gap-1">
                  Kode Barang
                  <svg class="w-3 h-3" :class="{
                    'text-blue-600': sorting.sort_by === 'kode_barang',
                    'rotate-180': sorting.sort_by === 'kode_barang' && sorting.sort_order === 'desc'
                  }" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"/>
                  </svg>
                </div>
              </th>
              <th 
                @click="sortBy('nama_barang')"
                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider cursor-pointer hover:bg-gray-100 select-none"
              >
                <div class="flex items-center gap-1">
                  Nama Barang
                  <svg class="w-3 h-3" :class="{
                    'text-blue-600': sorting.sort_by === 'nama_barang',
                    'rotate-180': sorting.sort_by === 'nama_barang' && sorting.sort_order === 'desc'
                  }" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"/>
                  </svg>
                </div>
              </th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Satuan</th>
              <th 
                @click="sortBy('stok_awal')"
                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider cursor-pointer hover:bg-gray-100 select-none"
              >
                <div class="flex items-center gap-1">
                  Stok Awal
                  <svg class="w-3 h-3" :class="{
                    'text-blue-600': sorting.sort_by === 'stok_awal',
                    'rotate-180': sorting.sort_by === 'stok_awal' && sorting.sort_order === 'desc'
                  }" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"/>
                  </svg>
                </div>
              </th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Total Masuk</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Total Keluar</th>
              <th 
                @click="sortBy('stok_akhir')"
                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider cursor-pointer hover:bg-gray-100 select-none"
              >
                <div class="flex items-center gap-1">
                  Stok Akhir
                  <svg class="w-3 h-3" :class="{
                    'text-blue-600': sorting.sort_by === 'stok_akhir',
                    'rotate-180': sorting.sort_by === 'stok_akhir' && sorting.sort_order === 'desc'
                  }" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"/>
                  </svg>
                </div>
              </th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
            </tr>
          </thead>
          <tbody class="bg-white divide-y divide-gray-200">
            <tr v-if="loading">
              <td colspan="9" class="px-6 py-4 text-center text-gray-500">Loading...</td>
            </tr>
            <tr v-else-if="reports.length === 0">
              <td colspan="9" class="px-6 py-4 text-center text-gray-500">Tidak ada data</td>
            </tr>
            <tr v-else v-for="(report, index) in reports" :key="report.id" class="hover:bg-gray-50">
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ (pagination.current_page - 1) * pagination.per_page + index + 1 }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{{ report.kode_barang }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ report.nama_barang }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ report.satuan }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ report.stok_awal }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-green-600">+{{ report.total_masuk }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-red-600">-{{ report.total_keluar }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{{ report.stok_akhir }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm">
                <span :class="getStatusClass(report.status_stok)" class="px-2 py-1 rounded-full text-xs font-medium">
                  {{ getStatusText(report.status_stok) }}
                </span>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      
      <!-- Pagination -->
      <div class="px-6 py-3 border-t border-gray-200 flex items-center justify-between">
        <div class="flex items-center gap-2">
          <button 
            @click="changePage(pagination.current_page - 1)"
            :disabled="pagination.current_page <= 1"
            class="px-3 py-1 text-sm border border-gray-300 rounded hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
          >
            Sebelumnya
          </button>
          
          <div class="flex gap-1">
            <button 
              v-for="page in getPageNumbers()"
              :key="page"
              @click="changePage(page)"
              :class="{
                'bg-blue-600 text-white': page === pagination.current_page,
                'bg-white text-gray-700 hover:bg-gray-50': page !== pagination.current_page
              }"
              class="px-3 py-1 text-sm border border-gray-300 rounded"
            >
              {{ page }}
            </button>
          </div>
          
          <button 
            @click="changePage(pagination.current_page + 1)"
            :disabled="pagination.current_page >= pagination.last_page"
            class="px-3 py-1 text-sm border border-gray-300 rounded hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
          >
            Selanjutnya
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import reportService from '@/services/reportService.js'
import itemService from '@/services/itemService.js'

export default {
  name: 'ReportsView',
  data() {
    return {
      reports: [],
      availableUnits: [],
      loading: false,
      filters: {
        search: '',
        start_date: '',
        end_date: '',
        satuan: ''
      },
      pagination: {
        current_page: 1,
        last_page: 1,
        per_page: 10,
        total: 0
      },
      sorting: {
        sort_by: 'kode_barang',
        sort_order: 'asc'
      },
      searchTimeout: null
    }
  },
  async mounted() {
    await this.fetchUnits()
    await this.fetchReport()
  },
  methods: {
    async fetchReport(page = 1) {
      this.loading = true
      try {
        const params = {
          page,
          per_page: this.pagination.per_page,
          sort_by: this.sorting.sort_by,
          sort_order: this.sorting.sort_order,
          ...this.filters
        }
        
        const response = await reportService.getStockReport(params)
        this.reports = response.data.data
        this.pagination = {
          current_page: response.data.current_page,
          last_page: response.data.last_page,
          per_page: response.data.per_page,
          total: response.data.total
        }
      } catch (error) {
        console.error('Error fetching report:', error)
      } finally {
        this.loading = false
      }
    },
    
    async fetchUnits() {
      try {
        const response = await itemService.getUnits()
        this.availableUnits = response.data.units
      } catch (error) {
        console.error('Error fetching units:', error)
      }
    },
    
    debounceSearch() {
      clearTimeout(this.searchTimeout)
      this.searchTimeout = setTimeout(() => {
        this.fetchReport(1)
      }, 500)
    },
    
    sortBy(column) {
      if (this.sorting.sort_by === column) {
        this.sorting.sort_order = this.sorting.sort_order === 'asc' ? 'desc' : 'asc'
      } else {
        this.sorting.sort_by = column
        this.sorting.sort_order = 'asc'
      }
      this.fetchReport(1)
    },
    
    changePage(page) {
      this.fetchReport(page)
    },
    
    changePerPage(perPage) {
      this.pagination.per_page = perPage
      this.fetchReport(1)
    },
    
    resetFilters() {
      this.filters = {
        search: '',
        start_date: '',
        end_date: '',
        satuan: ''
      }
      this.fetchReport(1)
    },
    

    
    getPageNumbers() {
      const pages = []
      const current = this.pagination.current_page
      const last = this.pagination.last_page
      
      let start = Math.max(1, current - 2)
      let end = Math.min(last, start + 4)
      
      if (end - start < 4) {
        start = Math.max(1, end - 4)
      }
      
      for (let i = start; i <= end; i++) {
        pages.push(i)
      }
      
      return pages
    },
    
    getStatusClass(status) {
      const classes = {
        'aman': 'bg-green-100 text-green-800',
        'hampir habis': 'bg-yellow-100 text-yellow-800',
        'habis': 'bg-red-100 text-red-800'
      }
      return classes[status] || 'bg-gray-100 text-gray-800'
    },
    
    getStatusText(status) {
      const texts = {
        'aman': 'Aman',
        'hampir habis': 'Hampir Habis',
        'habis': 'Habis'
      }
      return texts[status] || status
    }
  }
}
</script>