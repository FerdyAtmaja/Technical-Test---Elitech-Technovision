<script>
import authService from '@/services/authService.js'

export default {
  name: 'Navbar',
  data() {
    return {
      showDropdown: false,
      user: authService.getUser()
    }
  },
  computed: {
    pageTitle() {
      const titles = {
        '/dashboard': 'Dashboard',
        '/items': 'Master Barang',
        '/items/in': 'Barang Masuk',
        '/items/out': 'Barang Keluar',
        '/reports': 'Laporan Stok'
      }
      return titles[this.$route.path] || 'Dashboard'
    },
    userInitial() {
      return this.user?.name?.charAt(0).toUpperCase() || 'U'
    },
    roleLabel() {
      const roles = {
        'admin': 'Administrator',
        'manager': 'Manager',
        'staff': 'Staff'
      }
      return roles[this.user?.role] || 'User'
    }
  },
  methods: {
    toggleSidebar() {
      this.$emit('toggle-sidebar')
    },
    toggleDropdown() {
      this.showDropdown = !this.showDropdown
    },
    async handleLogout() {
      await authService.logout()
      this.$router.push('/login')
    }
  },
  mounted() {
    document.addEventListener('click', (e) => {
      if (!this.$el.contains(e.target)) {
        this.showDropdown = false
      }
    })
  }
}
</script>

<template>
  <nav class="h-16 bg-white border-b border-gray-200 shadow-sm flex items-center justify-between px-6 fixed top-0 right-0 z-50 transition-all duration-300" :class="$parent.sidebarCollapsed ? 'left-[70px]' : 'left-64'">
    <div class="flex items-center gap-4">
      <button @click="toggleSidebar" class="p-2 rounded-md cursor-pointer text-gray-500 transition-all duration-200 hover:bg-gray-100 hover:text-gray-700">
        <svg class="w-5 h-5 stroke-[1.5]" viewBox="0 0 24 24" fill="none" stroke="currentColor">
          <line x1="3" y1="6" x2="21" y2="6"/>
          <line x1="3" y1="12" x2="21" y2="12"/>
          <line x1="3" y1="18" x2="21" y2="18"/>
        </svg>
      </button>
      <h1 class="text-xl font-semibold text-gray-900 m-0">{{ pageTitle }}</h1>
    </div>
    
    <div class="relative">
      <div @click="toggleDropdown" class="flex items-center gap-3 cursor-pointer p-2 rounded-lg transition-colors duration-200 hover:bg-gray-50">
        <div class="flex flex-col items-end md:flex">
          <span class="text-sm font-medium text-gray-900">{{ user?.name }}</span>
          <span class="text-xs text-gray-500">{{ roleLabel }}</span>
        </div>
        <div class="w-10 h-10 bg-gradient-to-br from-blue-500 to-blue-700 rounded-full flex items-center justify-center text-white font-semibold text-base">{{ userInitial }}</div>
        
        <div v-show="showDropdown" class="absolute top-full right-0 bg-white border border-gray-200 rounded-lg shadow-lg min-w-[180px] z-50 mt-2">

          <button @click="handleLogout" class="flex items-center gap-3 px-4 py-3 text-gray-700 text-sm transition-colors duration-200 hover:bg-gray-50 w-full text-left">
            <svg class="w-4 h-4 stroke-[1.5]" viewBox="0 0 24 24" fill="none" stroke="currentColor">
              <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/>
              <polyline points="16,17 21,12 16,7"/>
              <line x1="21" y1="12" x2="9" y2="12"/>
            </svg>
            Logout
          </button>
        </div>
      </div>
    </div>
  </nav>
</template>