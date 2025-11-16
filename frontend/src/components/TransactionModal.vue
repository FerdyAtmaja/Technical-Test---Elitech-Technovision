<template>
  <div v-if="show" class="fixed inset-0 bg-black bg-opacity-20 flex items-center justify-center z-50">
    <div class="bg-white rounded-lg p-6 w-full max-w-md">
      <h3 class="text-lg font-semibold mb-4">{{ title }}</h3>
      
      <form @submit.prevent="handleSubmit">
        <div class="mb-4">
          <label class="block text-sm font-medium mb-2">Barang</label>
          <select 
            v-model="form.item_id" 
            @change="onItemChange"
            required
            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
          >
            <option value="">Pilih Barang</option>
            <option v-for="item in items" :key="item.id" :value="item.id">
              {{ item.kode_barang }} - {{ item.nama_barang }}
            </option>
          </select>
          <div v-if="selectedItem && type === 'keluar'" class="mt-2 text-sm text-gray-600">
            Stok tersedia: <span class="font-medium text-blue-600">{{ selectedItem.current_stock }}</span> {{ selectedItem.satuan }}
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
                ⚠️ Jumlah melebihi stok tersedia! Kekurangan: {{ form.jumlah - selectedItem.current_stock }} {{ selectedItem.satuan }}
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
            :disabled="isStockExceeded"
            :class="{
              'bg-green-600 hover:bg-green-700': type === 'masuk' && !isStockExceeded,
              'bg-red-600 hover:bg-red-700': type === 'keluar' && !isStockExceeded,
              'bg-gray-400 cursor-not-allowed': isStockExceeded
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
      showConfirmation: false
    }
  },
  computed: {
    title() {
      return this.type === 'masuk' ? 'Tambah Barang Masuk' : 'Tambah Barang Keluar'
    },
    isStockExceeded() {
      return this.type === 'keluar' && this.selectedItem && this.form.jumlah > this.selectedItem.current_stock
    },
    remainingStock() {
      if (!this.selectedItem || this.type !== 'keluar') return 0
      return Math.max(0, this.selectedItem.current_stock - this.form.jumlah)
    }
  },
  watch: {
    show(newVal) {
      if (newVal) {
        this.updateDateTime()
        this.dateInterval = setInterval(this.updateDateTime, 1000)
      } else {
        if (this.dateInterval) {
          clearInterval(this.dateInterval)
          this.dateInterval = null
        }
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
  },
  methods: {
    handleSubmit() {
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
    },
    updateDateTime() {
      this.form.tanggal_transaksi = new Date().toISOString().split('T')[0]
    },
    onItemChange() {
      this.selectedItem = this.items.find(item => item.id == this.form.item_id)
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