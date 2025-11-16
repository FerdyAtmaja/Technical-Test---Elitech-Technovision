<template>
  <div class="p-6">
    <div class="flex justify-between items-center mb-6">
      <h1 class="text-2xl font-bold text-gray-900">Master Barang</h1>
      <button 
        @click="openModal()"
        class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 flex items-center gap-2"
      >
        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
        </svg>
        Tambah Barang
      </button>
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
              <th 
                @click="sortBy('satuan')"
                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider cursor-pointer hover:bg-gray-100 select-none"
              >
                <div class="flex items-center gap-1">
                  Satuan
                  <svg class="w-3 h-3" :class="{
                    'text-blue-600': sorting.sort_by === 'satuan',
                    'rotate-180': sorting.sort_by === 'satuan' && sorting.sort_order === 'desc'
                  }" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"/>
                  </svg>
                </div>
              </th>
              <th 
                @click="sortBy('stock')"
                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider cursor-pointer hover:bg-gray-100 select-none"
              >
                <div class="flex items-center gap-1">
                  Stok
                  <svg class="w-3 h-3" :class="{
                    'text-blue-600': sorting.sort_by === 'stock',
                    'rotate-180': sorting.sort_by === 'stock' && sorting.sort_order === 'desc'
                  }" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"/>
                  </svg>
                </div>
              </th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Aksi</th>
            </tr>
          </thead>
          <tbody class="bg-white divide-y divide-gray-200">
            <tr v-if="loading">
              <td colspan="6" class="px-6 py-4 text-center text-gray-500">Loading...</td>
            </tr>
            <tr v-else-if="items.length === 0">
              <td colspan="6" class="px-6 py-4 text-center text-gray-500">Tidak ada data</td>
            </tr>
            <tr v-else v-for="(item, index) in items" :key="item.id" class="hover:bg-gray-50">
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ (pagination.current_page - 1) * pagination.per_page + index + 1 }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{{ item.kode_barang }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ item.nama_barang }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ item.satuan }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ item.stock }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                <div class="flex gap-2">
                  <button 
                    @click="openModal(item)"
                    class="text-blue-600 hover:text-blue-900"
                  >
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                    </svg>
                  </button>
                  <button 
                    @click="deleteItem(item)"
                    class="text-red-600 hover:text-red-900"
                  >
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                    </svg>
                  </button>
                </div>
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

    <ItemModal 
      :show="showModal"
      :item="selectedItem"
      :is-edit="isEdit"
      @close="closeModal"
      @save="saveItem"
    />
    
    <NotificationModal
      :show="notification.show"
      :type="notification.type"
      :title="notification.title"
      :message="notification.message"
      @close="closeNotification"
    />
  </div>
</template>

<script>
import ItemModal from '@/components/ItemModal.vue'
import NotificationModal from '@/components/NotificationModal.vue'
import itemService from '@/services/itemService.js'

export default {
  name: 'ItemsView',
  components: {
    ItemModal,
    NotificationModal
  },
  data() {
    return {
      items: [],
      loading: false,
      showModal: false,
      selectedItem: null,
      isEdit: false,
      pagination: {
        current_page: 1,
        last_page: 1,
        per_page: 10,
        total: 0
      },
      sorting: {
        sort_by: 'id',
        sort_order: 'asc'
      },
      itemService,
      notification: {
        show: false,
        type: 'success',
        title: '',
        message: ''
      }
    }
  },
  async mounted() {
    await this.fetchItems()
  },
  methods: {
    async fetchItems(page = 1) {
      this.loading = true
      try {
        const params = {
          page,
          per_page: this.pagination.per_page,
          sort_by: this.sorting.sort_by,
          sort_order: this.sorting.sort_order
        }
        
        const response = await itemService.getAll(params)
        this.items = response.data.data
        this.pagination = {
          current_page: response.data.current_page,
          last_page: response.data.last_page,
          per_page: response.data.per_page,
          total: response.data.total
        }
      } catch (error) {
        console.error('Error fetching items:', error)
        this.showNotification('error', 'Gagal', 'Gagal memuat data barang')
      } finally {
        this.loading = false
      }
    },
    
    openModal(item = null) {
      this.selectedItem = item
      this.isEdit = !!item
      this.showModal = true
    },
    
    closeModal() {
      this.showModal = false
      this.selectedItem = null
      this.isEdit = false
    },
    
    async saveItem(formData) {
      try {
        if (this.isEdit) {
          await itemService.update(this.selectedItem.id, formData)
          this.showNotification('success', 'Berhasil', 'Barang berhasil diupdate')
        } else {
          await itemService.create(formData)
          this.showNotification('success', 'Berhasil', 'Barang berhasil ditambahkan')
        }
        
        this.closeModal()
        await this.fetchItems()
      } catch (error) {
        console.error('Error saving item:', error)
        this.showNotification('error', 'Gagal', 'Gagal menyimpan data barang')
      }
    },
    
    async deleteItem(item) {
      if (confirm(`Apakah Anda yakin ingin menghapus barang "${item.nama_barang}"?`)) {
        try {
          await itemService.delete(item.id)
          this.showNotification('success', 'Berhasil', 'Barang berhasil dihapus')
          await this.fetchItems()
        } catch (error) {
          console.error('Error deleting item:', error)
          this.showNotification('error', 'Gagal', 'Gagal menghapus barang')
        }
      }
    },
    
    sortBy(column) {
      if (this.sorting.sort_by === column) {
        this.sorting.sort_order = this.sorting.sort_order === 'asc' ? 'desc' : 'asc'
      } else {
        this.sorting.sort_by = column
        this.sorting.sort_order = 'asc'
      }
      this.fetchItems(1)
    },
    
    changePage(page) {
      this.fetchItems(page)
    },
    
    changePerPage(perPage) {
      this.pagination.per_page = perPage
      this.fetchItems(1)
    },
    
    getPageNumbers() {
      const pages = []
      const current = this.pagination.current_page
      const last = this.pagination.last_page
      
      // Show max 5 page numbers
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