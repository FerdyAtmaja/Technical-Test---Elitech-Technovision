<template>
  <div v-if="show" class="fixed inset-0 bg-black bg-opacity-20 flex items-center justify-center z-50" @click.self="$emit('close')">
    <div class="bg-white rounded-lg p-6 w-full max-w-md max-h-[90vh] overflow-y-auto relative">
      <h3 class="text-lg font-semibold mb-4">{{ title }}</h3>
      
      <form @submit.prevent="handleSubmit">
        <div class="mb-4 relative">
          <label class="block text-sm font-medium mb-2">Barang</label>
          
          <!-- Custom Dropdown -->
          <div class="relative">
            <button
              type="button"
              @click="toggleDropdown"
              class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 text-left bg-white flex justify-between items-center"
            >
              <span class="truncate">
                {{ selectedItem ? `${selectedItem.kode_barang} - ${selectedItem.nama_barang}` : 'Pilih Barang' }}
              </span>
              <svg class="w-4 h-4 text-gray-400" :class="{ 'rotate-180': showDropdown }" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
              </svg>
            </button>
            
            <!-- Dropdown Options -->
            <div v-if="showDropdown" class="absolute z-50 w-full mt-1 bg-white border border-gray-300 rounded-md shadow-lg max-h-60 overflow-y-auto">
              <div class="p-2">
                <input
                  v-model="searchTerm"
                  type="text"
                  placeholder="Cari barang..."
                  class="w-full px-3 py-2 border border-gray-300 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-blue-500"
                  @click.stop
                >
              </div>
              <div class="max-h-48 overflow-y-auto">
                <button
                  v-for="item in filteredItems"
                  :key="item.id"
                  type="button"
                  @click="selectItem(item)"
                  class="w-full px-3 py-2 text-left hover:bg-gray-100 focus:bg-gray-100 focus:outline-none text-sm"
                >
                  <div class="font-medium">{{ item.kode_barang }}</div>
                  <div class="text-gray-600 text-xs truncate">{{ item.nama_barang }}</div>
                </button>
                <div v-if="filteredItems.length === 0" class="px-3 py-2 text-gray-500 text-sm">
                  Tidak ada barang ditemukan
                </div>
              </div>
            </div>
          </div>
          
          <div v-if="selectedItem && type === 'keluar'" class="mt-2 text-sm text-gray-600">
            Stok tersedia: <span class="font-medium text-blue-600">{{ selectedItem.stock }}</span> {{ selectedItem.satuan }}
          </div>
        </div>
        
        <div class="mb-4">
          <label class="block text-sm font-medium mb-2">Tanggal Transaksi</label>
          <input 
            v-model="form.tanggal_transaksi" 
            type="date" 
            required
            disabled
            class="w-full px-3 py-2 border border-gray-300 rounded-md bg-gray-100 text-gray-600 cursor-not-allowed"
          >
        </div>
        
        <div class="mb-4">
          <label class="block text-sm font-medium mb-2">Jumlah</label>
          <input 
            :value="form.jumlah"
            @input="onJumlahInput"
            type="text" 
            required
            placeholder="Masukkan angka saja"
            :class="{
              'border-red-500 focus:ring-red-500': isStockExceeded,
              'border-gray-300 focus:ring-blue-500': !isStockExceeded
            }"
            class="w-full px-3 py-2 border rounded-md focus:outline-none focus:ring-2"
          >
          <div v-if="selectedItem && type === 'keluar'" class="mt-2">
            <div v-if="form.jumlah > 0" class="text-sm">
              <span v-if="!isStockExceeded" class="text-green-600">
                Sisa stok setelah keluar: <span class="font-medium">{{ remainingStock }}</span> {{ selectedItem.satuan }}
              </span>
              <span v-else class="text-red-600 font-medium">
                ⚠️ Jumlah melebihi stok tersedia! Kekurangan: {{ form.jumlah - selectedItem.stock }} {{ selectedItem.satuan }}
              </span>
            </div>
          </div>
        </div>
        
        <div class="mb-6">
          <label class="block text-sm font-medium mb-2">Keterangan</label>
          <textarea 
            v-model="form.keterangan" 
            rows="3"
            placeholder="Keterangan (opsional)"
            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
          ></textarea>
        </div>
        
        <div class="flex justify-end gap-2">
          <button 
            type="button" 
            @click="$emit('close')"
            class="px-4 py-2 text-gray-600 border border-gray-300 rounded-md hover:bg-gray-50"
          >
            Batal
          </button>
          <button 
            type="submit"
            :disabled="isStockExceeded || !selectedItem"
            :class="{
              'bg-green-600 hover:bg-green-700': type === 'masuk' && !isStockExceeded && selectedItem,
              'bg-red-600 hover:bg-red-700': type === 'keluar' && !isStockExceeded && selectedItem,
              'bg-gray-400 cursor-not-allowed': isStockExceeded || !selectedItem
            }"
            class="px-4 py-2 text-white rounded-md"
          >
            Simpan
          </button>
        </div>
      </form>
    </div>
    
    <!-- Confirmation Modal -->
    <ConfirmationModal
      :show="showConfirmation"
      :title="'Konfirmasi Transaksi ' + (type === 'masuk' ? 'Barang Masuk' : 'Barang Keluar')"
      :message="'Apakah Anda yakin ingin menyimpan transaksi ini?'"
      :data="getDisplayData()"
      :type="'create'"
      :confirm-text="'Simpan'"
      @confirm="confirmSave"
      @cancel="cancelSave"
    />
  </div>
</template>

<script>
import ConfirmationModal from './ConfirmationModal.vue'

export default {
  name: 'TransactionModal',
  components: {
    ConfirmationModal
  },
  props: {
    show: Boolean,
    items: Array,
    type: {
      type: String,
      default: 'masuk'
    }
  },
  emits: ['close', 'save'],
  data() {
    return {
      form: {
        item_id: '',
        jenis_transaksi: this.type,
        tanggal_transaksi: new Date().toISOString().split('T')[0],
        jumlah: 0,
        keterangan: ''
      },
      selectedItem: null,
      dateInterval: null,
      showConfirmation: false,
      showDropdown: false,
      searchTerm: ''
    }
  },
  computed: {
    title() {
      return this.type === 'masuk' ? 'Tambah Barang Masuk' : 'Tambah Barang Keluar'
    },
    isStockExceeded() {
      return this.type === 'keluar' && this.selectedItem && this.form.jumlah > this.selectedItem.stock
    },
    remainingStock() {
      if (!this.selectedItem || this.type !== 'keluar') return 0
      return Math.max(0, this.selectedItem.stock - this.form.jumlah)
    },
    filteredItems() {
      if (!this.searchTerm) return this.items || []
      const term = this.searchTerm.toLowerCase()
      return (this.items || []).filter(item => 
        item.kode_barang.toLowerCase().includes(term) ||
        item.nama_barang.toLowerCase().includes(term)
      )
    }
  },
  watch: {
    show(newVal) {
      if (newVal) {
        this.updateDateTime()
        this.dateInterval = setInterval(this.updateDateTime, 1000)
        document.addEventListener('click', this.handleClickOutside)
      } else {
        if (this.dateInterval) {
          clearInterval(this.dateInterval)
          this.dateInterval = null
        }
        document.removeEventListener('click', this.handleClickOutside)
        this.resetForm()
      }
    },
    type(newVal) {
      this.form.jenis_transaksi = newVal
    }
  },
  beforeUnmount() {
    if (this.dateInterval) {
      clearInterval(this.dateInterval)
    }
    document.removeEventListener('click', this.handleClickOutside)
  },
  methods: {
    handleSubmit() {
      if (!this.selectedItem) return
      this.showConfirmation = true
    },
    
    confirmSave() {
      this.$emit('save', { ...this.form })
      this.showConfirmation = false
    },
    
    cancelSave() {
      this.showConfirmation = false
    },
    
    resetForm() {
      this.form = {
        item_id: '',
        jenis_transaksi: this.type,
        tanggal_transaksi: new Date().toISOString().split('T')[0],
        jumlah: 0,
        keterangan: ''
      }
      this.selectedItem = null
      this.showDropdown = false
      this.searchTerm = ''
    },
    
    updateDateTime() {
      this.form.tanggal_transaksi = new Date().toISOString().split('T')[0]
    },
    
    toggleDropdown() {
      this.showDropdown = !this.showDropdown
      if (this.showDropdown) {
        this.searchTerm = ''
      }
    },
    
    selectItem(item) {
      this.selectedItem = item
      this.form.item_id = item.id
      this.showDropdown = false
      this.searchTerm = ''
    },
    
    handleClickOutside(event) {
      if (!this.$el.contains(event.target)) {
        this.showDropdown = false
      }
    },
    
    onJumlahInput(event) {
      const value = event.target.value.replace(/[^0-9]/g, '')
      const numValue = value ? parseInt(value) : 0
      this.form.jumlah = numValue > 0 ? numValue : 0
      event.target.value = this.form.jumlah || ''
    },
    
    getDisplayData() {
      const itemName = this.selectedItem ? `${this.selectedItem.kode_barang} - ${this.selectedItem.nama_barang}` : 'Pilih Barang'
      return {
        'Barang': itemName,
        'Jenis Transaksi': this.form.jenis_transaksi === 'masuk' ? 'Barang Masuk' : 'Barang Keluar',
        'Tanggal': this.form.tanggal_transaksi,
        'Jumlah': this.form.jumlah,
        'Keterangan': this.form.keterangan || '-'
      }
    }
  }
}
</script>