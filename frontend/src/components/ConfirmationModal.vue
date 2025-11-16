<template>
  <div v-if="show" class="fixed inset-0 bg-black bg-opacity-20 flex items-center justify-center z-50">
    <div class="bg-white rounded-lg p-6 w-full max-w-md">
      <h3 class="text-lg font-semibold mb-4">{{ title }}</h3>
      
      <div class="mb-6">
        <p class="text-gray-600 mb-4">{{ message }}</p>
        
        <!-- Detail Data untuk Preview -->
        <div v-if="data && !secondConfirmation" class="bg-gray-50 rounded-lg p-4 space-y-2">
          <div v-for="(value, key) in displayData" :key="key" class="flex justify-between">
            <span class="font-medium text-gray-700">{{ formatLabel(key) }}:</span>
            <span class="text-gray-900">{{ value }}</span>
          </div>
        </div>
        
        <!-- Konfirmasi Kedua -->
        <div v-if="secondConfirmation" class="bg-yellow-50 border border-yellow-200 rounded-lg p-4">
          <p class="text-yellow-800 font-medium">{{ finalConfirmationMessage }}</p>
        </div>
      </div>
      
      <div class="flex justify-end gap-2">
        <button 
          @click="handleCancel"
          class="px-4 py-2 text-gray-600 border border-gray-300 rounded-md hover:bg-gray-50"
        >
          Batal
        </button>
        <button 
          @click="handleConfirm"
          :class="confirmButtonClass"
          class="px-4 py-2 text-white rounded-md"
        >
          {{ secondConfirmation ? 'Ya, Yakin' : confirmText }}
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ConfirmationModal',
  props: {
    show: Boolean,
    title: String,
    message: String,
    data: Object,
    type: {
      type: String,
      default: 'confirm'
    },
    confirmText: {
      type: String,
      default: 'Konfirmasi'
    },
    items: {
      type: Array,
      default: () => []
    }
  },
  emits: ['confirm', 'cancel'],
  data() {
    return {
      secondConfirmation: false
    }
  },
  computed: {
    confirmButtonClass() {
      const classes = {
        'create': 'bg-blue-600 hover:bg-blue-700',
        'update': 'bg-green-600 hover:bg-green-700',
        'delete': 'bg-red-600 hover:bg-red-700',
        'cancel': 'bg-orange-600 hover:bg-orange-700',
        'restore': 'bg-green-600 hover:bg-green-700'
      }
      return classes[this.type] || 'bg-gray-600 hover:bg-gray-700'
    },
    
    displayData() {
      if (!this.data) return {}
      
      // Filter audit fields dan format data
      const auditFields = ['id', 'created_at', 'updated_at', 'deleted_at', 'canceled_at', 'canceled_by', 'restored_at', 'restored_by', 'lock_version', 'item_id', 'item']
      const filtered = {}
      
      Object.keys(this.data).forEach(key => {
        if (!auditFields.includes(key) && this.data[key] !== null) {
          filtered[key] = this.data[key]
        }
      })
      return filtered
    },
    
    finalConfirmationMessage() {
      const actions = {
        'create': 'menambahkan',
        'update': 'mengubah', 
        'delete': 'menghapus',
        'cancel': 'membatalkan',
        'restore': 'memulihkan'
      }
      const action = actions[this.type] || 'melakukan aksi pada'
      return `Apakah Anda yakin ingin ${action} data ini?`
    }
  },
  methods: {
    formatLabel(key) {
      const labels = {
        'kode_barang': 'Kode Barang',
        'nama_barang': 'Nama Barang',
        'satuan': 'Satuan',
        'stock': 'Stok',
        'jenis_transaksi': 'Jenis Transaksi',
        'tanggal_transaksi': 'Tanggal',
        'jumlah': 'Jumlah',
        'keterangan': 'Keterangan',
        'status': 'Status'
      }
      return labels[key] || key.replace('_', ' ').replace(/\b\w/g, l => l.toUpperCase())
    },
    
    handleConfirm() {
      if (!this.secondConfirmation) {
        this.secondConfirmation = true
      } else {
        this.$emit('confirm')
        this.resetModal()
      }
    },
    
    handleCancel() {
      this.$emit('cancel')
      this.resetModal()
    },
    
    resetModal() {
      this.secondConfirmation = false
    }
  },
  
  watch: {
    show(newVal) {
      if (!newVal) {
        this.resetModal()
      }
    }
  }
}
</script>