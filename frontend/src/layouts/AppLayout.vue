<template>
  <div class="min-h-screen bg-gray-50">
    <Sidebar :isCollapsed="sidebarCollapsed" />
    <Navbar @toggle-sidebar="toggleSidebar" />
    <main class="mt-16 transition-all duration-300" :class="sidebarCollapsed ? 'ml-[70px]' : 'ml-64'">
      <div class="p-8 max-w-7xl mx-auto md:p-4">
        <slot />
      </div>
    </main>
  </div>
</template>

<script>
import Navbar from '@/components/Navbar.vue'
import Sidebar from '@/components/Sidebar.vue'

export default {
  name: 'AppLayout',
  components: {
    Navbar,
    Sidebar
  },
  data() {
    return {
      sidebarCollapsed: false
    }
  },
  methods: {
    toggleSidebar() {
      this.sidebarCollapsed = !this.sidebarCollapsed
    }
  },
  mounted() {
    if (window.innerWidth <= 768) {
      this.sidebarCollapsed = true
    }
  }
}
</script>