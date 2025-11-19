<template>
  <div class="p-6">
    <div class="mb-6">
      <div class="flex justify-between items-center mb-4">
        <h1 class="text-2xl font-bold text-gray-900">Barang Masuk</h1>
        <button 
          @click="openModal()"
          class="px-4 py-2 bg-green-600 text-white rounded-md hover:bg-green-700 flex items-center gap-2"
        >
          <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
          </svg>
          Tambah Barang Masuk
        </button>
      </div>
      
      <div class="mb-4">
        <input 
          v-model="searchQuery"
          @input="debounceSearch"
          type="text" 
          placeholder="Cari kode barang, nama barang, atau keterangan..."
          class="w-full max-w-md px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
        >
      </div>
    </div>

    <div class="bg-white rounded-lg shadow overflow-hidden">
      <div class="p-4 border-b border-gray-200 flex justify-between items-center">
        <div class="flex items-center gap-2">
          <span class="text-sm text-gray-700">Tampilkan</span>
          <select 
            v-model="pagination.per_page" 
            @change="changePerPage($event.target.value)"
            class="border border-gray-300 rounded px-2 py-1 text-sm"
          >
            <option value="5">5</option>
            <option value="10">10</option>
            <option value="25">25</option>
            <option value="50">50</option>
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
                @click="sortBy('tanggal_transaksi')"
                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider cursor-pointer hover:bg-gray-100 select-none"
              >
                <div class="flex items-center gap-1">
                  Tanggal
                  <svg class="w-3 h-3" :class="{
                    'text-blue-600': sorting.sort_by === 'tanggal_transaksi',
                    'rotate-180': sorting.sort_by === 'tanggal_transaksi' && sorting.sort_order === 'desc'
                  }" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"/>
                  </svg>
                </div>
              </th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Kode Barang</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nama Barang</th>
              <th 
                @click="sortBy('jumlah')"
                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider cursor-pointer hover:bg-gray-100 select-none"
              >
                <div class="flex items-center gap-1">
                  Jumlah
                  <svg class="w-3 h-3" :class="{
                    'text-blue-600': sorting.sort_by === 'jumlah',
                    'rotate-180': sorting.sort_by === 'jumlah' && sorting.sort_order === 'desc'
                  }" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"/>
                  </svg>
                </div>
              </th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Keterangan</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Info Aksi</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Aksi</th>
            </tr>
          </thead>
          <tbody class="bg-white divide-y divide-gray-200">
            <tr v-if="loading">
              <td colspan="9" class="px-6 py-4 text-center text-gray-500">Loading...</td>
            </tr>
            <tr v-else-if="transactions.length === 0">
              <td colspan="9" class="px-6 py-4 text-center text-gray-500">Tidak ada data</td>
            </tr>
            <tr v-else v-for="(transaction, index) in transactions" :key="transaction.id" class="hover:bg-gray-50">
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ (pagination.current_page - 1) * pagination.per_page + index + 1 }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ formatDate(transaction.tanggal_transaksi) }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{{ transaction.item?.kode_barang }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ transaction.item?.nama_barang }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-green-600 font-medium">+{{ transaction.jumlah }}</td>
              <td class="px-6 py-4 text-sm text-gray-900">{{ transaction.keterangan || '-' }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm">
                <span :class="{
                  'bg-green-100 text-green-800': transaction.status === 'aktif' || !transaction.status,
                  'bg-red-100 text-red-800': transaction.status === 'dibatalkan',
                  'bg-blue-100 text-blue-800': transaction.status === 'restored'
                }" class="px-2 py-1 rounded-full text-xs font-medium">
                  {{ getStatusText(transaction.status) }}
                </span>
              </td>
              <td class="px-6 py-4 text-sm text-gray-900">
                <div v-if="transaction.status === 'dibatalkan' && transaction.canceled_at" class="text-xs">
                  <div class="text-red-600">Dibatalkan:</div>
                  <div>{{ formatDateTime(transaction.canceled_at) }}</div>
                  <div v-if="transaction.canceled_by">oleh: {{ transaction.canceled_by.name }}</div>
                </div>
                <div v-else-if="transaction.status === 'restored' && transaction.restored_at" class="text-xs">
                  <div class="text-blue-600">Dipulihkan:</div>
                  <div>{{ formatDateTime(transaction.restored_at) }}</div>
                  <div v-if="transaction.restored_by">oleh: {{ transaction.restored_by.name }}</div>
                </div>
                <div v-else class="text-gray-400 text-xs">-</div>
              </td>
              <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                <div v-if="!canPerformAction(transaction)" class="relative group">
                  <div class="w-4 h-4 bg-gray-400 rounded-full cursor-not-allowed"></div>
                  <div class="absolute bottom-full left-1/2 transform -translate-x-1/2 mb-2 px-3 py-2 bg-gray-800 text-white text-xs rounded-lg opacity-0 group-hover:opacity-100 transition-opacity duration-200 whitespace-nowrap z-10 pointer-events-none">
                    {{ getActionTooltip(transaction) }}
                    <div class="absolute top-full left-1/2 transform -translate-x-1/2 border-4 border-transparent border-t-gray-800"></div>
                  </div>
                </div>
                <button 
                  v-else-if="transaction.status === 'dibatalkan'"
                  @click="restoreTransaction(transaction)"
                  class="text-green-600 hover:text-green-900"
                  :title="getActionTooltip(transaction)"
                >
                  <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"></path>
                  </svg>
                </button>
                <button 
                  v-else
                  @click="cancelTransaction(transaction)"
                  class="text-orange-600 hover:text-orange-900"
                  :title="getActionTooltip(transaction)"
                >
                  <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                  </svg>
                </button>
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

    <TransactionModal 
      :show="showModal"
      :items="items"
      type="masuk"
      @close="closeModal"
      @save="saveTransaction"
    />
    
    <NotificationModal
      :show="notification.show"
      :type="notification.type"
      :title="notification.title"
      :message="notification.message"
      @close="closeNotification"
    />
    
    <ConfirmationModal
      :show="showActionConfirmation"
      :title="confirmationType === 'cancel' ? 'Konfirmasi Batalkan Transaksi' : 'Konfirmasi Pulihkan Transaksi'"
      :message="confirmationType === 'cancel' ? 'Apakah Anda yakin ingin membatalkan transaksi ini? Stok akan dikembalikan.' : 'Apakah Anda yakin ingin memulihkan transaksi ini? Stok akan disesuaikan kembali.'"
      :data="selectedTransaction"
      :type="confirmationType"
      :confirm-text="confirmationType === 'cancel' ? 'Batalkan' : 'Pulihkan'"
      :items="items"
      @confirm="confirmAction"
      @cancel="cancelAction"
    />
  </div>
</template>

<script>
import TransactionModal from '@/components/TransactionModal.vue'
import NotificationModal from '@/components/NotificationModal.vue'
import ConfirmationModal from '@/components/ConfirmationModal.vue'
import transactionService from '@/services/transactionService.js'
import itemService from '@/services/itemService.js'

export default {
  name: 'ItemsInView',
  components: {
    TransactionModal,
    NotificationModal,
    ConfirmationModal
  },
  data() {
    return {
      transactions: [],
      items: [],
      loading: false,
      showModal: false,
      pagination: {
        current_page: 1,
        last_page: 1,
        per_page: 10,
        total: 0
      },
      sorting: {
        sort_by: 'tanggal_transaksi',
        sort_order: 'desc'
      },
      notification: {
        show: false,
        type: 'success',
        title: '',
        message: ''
      },
      searchQuery: '',
      searchTimeout: null,
      showActionConfirmation: false,
      selectedTransaction: null,
      confirmationType: null
    }
  },
  async mounted() {
    await this.fetchTransactions()
    await this.fetchItems()
  },
  methods: {
    async fetchTransactions(page = 1) {
      this.loading = true
      try {
        const params = {
          page,
          per_page: this.pagination.per_page,
          sort_by: this.sorting.sort_by,
          sort_order: this.sorting.sort_order,
          jenis_transaksi: 'masuk',
          search: this.searchQuery
        }
        
        const response = await transactionService.getAll(params)
        this.transactions = response.data.data
        this.pagination = {
          current_page: response.data.current_page,
          last_page: response.data.last_page,
          per_page: response.data.per_page,
          total: response.data.total
        }
      } catch (error) {
        console.error('Error fetching transactions:', error)
        this.showNotification('error', 'Gagal', 'Gagal memuat data transaksi')
      } finally {
        this.loading = false
      }
    },
    
    async fetchItems() {
      try {
        const response = await itemService.getAll({ per_page: 1000 })
        this.items = response.data.data || response.data
      } catch (error) {
        console.error('Error fetching items:', error)
      }
    },
    
    openModal() {
      this.showModal = true
    },
    
    closeModal() {
      this.showModal = false
    },
    
    async saveTransaction(formData) {
      try {
        await transactionService.create(formData)
        this.showNotification('success', 'Berhasil', 'Transaksi barang masuk berhasil ditambahkan')
        this.closeModal()
        await this.fetchTransactions()
        // Emit event to refresh other components
        this.$root.$emit('data-changed', { type: 'transaction', action: 'created' })
      } catch (error) {
        console.error('Error saving transaction:', error)
        this.showNotification('error', 'Gagal', 'Gagal menyimpan transaksi')
      }
    },
    
    cancelTransaction(transaction) {
      this.selectedTransaction = transaction
      this.confirmationType = 'cancel'
      this.showActionConfirmation = true
    },
    
    restoreTransaction(transaction) {
      this.selectedTransaction = transaction
      this.confirmationType = 'restore'
      this.showActionConfirmation = true
    },
    
    async confirmAction() {
      try {
        if (this.confirmationType === 'cancel') {
          await transactionService.cancel(this.selectedTransaction.id)
          this.showNotification('success', 'Berhasil', 'Transaksi berhasil dibatalkan dan stok telah dikembalikan')
        } else if (this.confirmationType === 'restore') {
          await transactionService.restore(this.selectedTransaction.id)
          this.showNotification('success', 'Berhasil', 'Transaksi berhasil dipulihkan')
        }
        await this.fetchTransactions()
        // Emit event to refresh other components
        this.$root.$emit('data-changed', { type: 'transaction', action: this.confirmationType })
      } catch (error) {
        console.error('Error with transaction action:', error)
        const message = error.response?.data?.message || `Gagal ${this.confirmationType === 'cancel' ? 'membatalkan' : 'memulihkan'} transaksi`
        this.showNotification('error', 'Gagal', message)
      } finally {
        this.showActionConfirmation = false
        this.selectedTransaction = null
        this.confirmationType = null
      }
    },
    
    cancelAction() {
      this.showActionConfirmation = false
      this.selectedTransaction = null
      this.confirmationType = null
    },
    
    getStatusText(status) {
      const statusMap = {
        'aktif': 'Aktif',
        'dibatalkan': 'Dibatalkan', 
        'restored': 'Dipulihkan'
      }
      return statusMap[status] || 'Aktif'
    },
    
    canPerformAction(transaction) {
      const transactionDate = new Date(transaction.tanggal_transaksi)
      const now = new Date()
      const diffDays = Math.floor((now - transactionDate) / (1000 * 60 * 60 * 24))
      return diffDays <= 7
    },
    
    isActionLimited(transaction) {
      const transactionDate = new Date(transaction.tanggal_transaksi)
      const now = new Date()
      const diffDays = Math.floor((now - transactionDate) / (1000 * 60 * 60 * 24))
      return diffDays > 3 && diffDays <= 7
    },
    
    getActionTooltip(transaction) {
      const transactionDate = new Date(transaction.tanggal_transaksi)
      const now = new Date()
      const diffDays = Math.floor((now - transactionDate) / (1000 * 60 * 60 * 24))
      
      if (diffDays > 7) {
        return 'Aksi tidak dapat dilakukan setelah 7 hari'
      } else if (diffDays > 3) {
        return `Transaksi sudah ${diffDays} hari, aksi terbatas`
      }
      return transaction.status === 'dibatalkan' ? 'Pulihkan Transaksi' : 'Batalkan Transaksi'
    },
    
    debounceSearch() {
      clearTimeout(this.searchTimeout)
      this.searchTimeout = setTimeout(() => {
        this.fetchTransactions(1)
      }, 500)
    },
    
    sortBy(column) {
      if (this.sorting.sort_by === column) {
        this.sorting.sort_order = this.sorting.sort_order === 'asc' ? 'desc' : 'asc'
      } else {
        this.sorting.sort_by = column
        this.sorting.sort_order = 'asc'
      }
      this.fetchTransactions(1)
    },
    
    changePage(page) {
      this.fetchTransactions(page)
    },
    
    changePerPage(perPage) {
      this.pagination.per_page = perPage
      this.fetchTransactions(1)
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
    
    formatDate(date) {
      return new Date(date).toLocaleDateString('id-ID')
    },
    
    formatDateTime(datetime) {
      return new Date(datetime).toLocaleString('id-ID')
    },
    
    showNotification(type, title, message) {
      this.notification = {
        show: true,
        type,
        title,
        message
      }
    },
    
    closeNotification() {
      this.notification.show = false
    }
  }
}
</script>