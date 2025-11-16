<template>
  <div v-if="show" class="fixed inset-0 bg-black bg-opacity-20 flex items-center justify-center z-50">
    <div class="bg-white rounded-lg p-6 w-full max-w-md">
      <h3 class="text-lg font-semibold mb-4">{{ isEdit ? 'Edit Barang' : 'Tambah Barang' }}</h3>
      
      <form @submit.prevent="handleSubmit">
        <div class="mb-4">
          <label class="block text-sm font-medium mb-2">Kode Barang</label>
          <input 
            v-model="form.kode_barang" 
            type="text" 
            required
            :disabled="true"
            class="w-full px-3 py-2 border border-gray-300 rounded-md bg-gray-100 text-gray-600 cursor-not-allowed"
          >
        </div>
        
        <div class="mb-4">
          <label class="block text-sm font-medium mb-2">Nama Barang</label>
          <input 
            v-model="form.nama_barang" 
            type="text" 
            required
            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
          >
        </div>
        
        <div class="mb-4">
          <label class="block text-sm font-medium mb-2">Satuan</label>
          <div v-if="!showCustomUnit">
            <select 
              :value="form.satuan || 'custom'"
              @change="onUnitChange($event.target.value)"
              class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
              <option value="custom">Masukkan Satuan</option>
              <option v-for="unit in availableUnits" :key="unit" :value="unit">
                {{ unit }}
              </option>
            </select>
          </div>
          <div v-else class="flex gap-2">
            <input 
              :value="form.satuan"
              @input="onSatuanInput"
              type="text" 
              required
              placeholder="Masukkan satuan"
              class="flex-1 px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
            <button 
              type="button"
              @click="showCustomUnit = false"
              class="px-3 py-2 text-gray-600 border border-gray-300 rounded-md hover:bg-gray-50"
            >
              Batal
            </button>
          </div>
        </div>
        
        <div class="mb-6">
          <div class="flex items-center gap-2 mb-2">
            <label class="block text-sm font-medium">Stok Awal</label>
            <div v-if="isEdit" class="relative">
              <svg 
                @mouseenter="showTooltip = true" 
                @mouseleave="showTooltip = false"
                class="w-4 h-4 text-gray-400 cursor-help" 
                fill="currentColor" 
                viewBox="0 0 20 20"
              >
                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-8-3a1 1 0 00-.867.5 1 1 0 11-1.731-1A3 3 0 0113 8a3.001 3.001 0 01-2 2.83V11a1 1 0 11-2 0v-1a1 1 0 011-1 1 1 0 100-2zm0 8a1 1 0 100-2 1 1 0 000 2z" clip-rule="evenodd"></path>
              </svg>
              <div v-show="showTooltip" class="absolute bottom-full left-1/2 transform -translate-x-1/2 mb-2 px-3 py-2 bg-gray-800 text-white text-xs rounded-lg whitespace-nowrap z-10 pointer-events-none">
                {{ hasTransactions ? 'Stok tidak dapat diubah karena sudah ada transaksi' : 'Stok dapat diubah karena belum ada transaksi' }}
                <div class="absolute top-full left-1/2 transform -translate-x-1/2 border-4 border-transparent border-t-gray-800"></div>
              </div>
            </div>
          </div>
          <input 
            :value="form.stock"
            @input="onStockInput"
            type="text" 
            required
            :disabled="isEdit && hasTransactions"
            :class="{
              'bg-gray-100 text-gray-600 cursor-not-allowed': isEdit && hasTransactions,
              'focus:outline-none focus:ring-2 focus:ring-blue-500': !(isEdit && hasTransactions)
            }"
            class="w-full px-3 py-2 border border-gray-300 rounded-md"
            placeholder="Masukkan angka saja"
          >
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
            class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700"
          >
            {{ isEdit ? 'Update' : 'Simpan' }}
          </button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ItemModal',
  props: {
    show: Boolean,
    item: Object,
    isEdit: Boolean
  },
  emits: ['close', 'save'],
  data() {
    return {
      form: {
        kode_barang: '',
        nama_barang: '',
        satuan: '',
        stock: 0
      },
      hasTransactions: false,
      loading: false,
      availableUnits: [],
      showCustomUnit: false,
      showTooltip: false
    }
  },
  computed: {
    unitOptions() {
      const units = [...this.availableUnits]
      if (!units.includes('custom')) {
        units.push('custom')
      }
      return units
    }
  },
  watch: {
    item: {
      async handler(newItem) {
        if (newItem) {
          this.form = { ...newItem }
          await this.checkItemTransactions()
        } else {
          this.resetForm()
        }
      },
      immediate: true
    },
    async show(newVal) {
      if (newVal) {
        await this.loadUnits()
        if (!this.isEdit) {
          await this.generateNextCode()
        }
      } else {
        this.resetForm()
      }
    }
  },
  methods: {
    handleSubmit() {
      this.$emit('save', { ...this.form })
    },
    resetForm() {
      this.form = {
        kode_barang: '',
        nama_barang: '',
        satuan: '',
        stock: 0
      }
      this.hasTransactions = false
      this.showCustomUnit = false
      this.showTooltip = false
    },
    async generateNextCode() {
      try {
        const response = await this.$parent.itemService.getNextCode()
        this.form.kode_barang = response.data.code
      } catch (error) {
        console.error('Error generating code:', error)
      }
    },
    async checkItemTransactions() {
      if (!this.item?.id) return
      
      try {
        const response = await this.$parent.itemService.checkTransactions(this.item.id)
        this.hasTransactions = response.data.has_transactions
      } catch (error) {
        console.error('Error checking transactions:', error)
      }
    },
    async loadUnits() {
      try {
        const response = await this.$parent.itemService.getUnits()
        this.availableUnits = response.data.units
      } catch (error) {
        console.error('Error loading units:', error)
      }
    },
    onUnitChange(value) {
      if (value === 'custom') {
        this.showCustomUnit = true
        this.form.satuan = ''
      } else {
        this.showCustomUnit = false
        this.form.satuan = value
      }
    },
    onStockInput(event) {
      const value = event.target.value.replace(/[^0-9]/g, '')
      const numValue = value ? parseInt(value) : 0
      this.form.stock = numValue >= 0 ? numValue : 0
      event.target.value = this.form.stock
    },
    onSatuanInput(event) {
      this.form.satuan = event.target.value.toLowerCase()
    }
  }
}
</script>