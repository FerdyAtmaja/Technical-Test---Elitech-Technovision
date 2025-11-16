<template>
  <aside class="fixed top-0 left-0 z-40 h-screen transition-all duration-300" :class="isCollapsed ? 'w-[70px]' : 'w-64'" style="background: #0E1F34;">
    <div class="p-5 border-b border-white/10">
      <div class="flex items-center gap-3">
        <span class="text-2xl min-w-[24px]">📦</span>
        <span v-show="!isCollapsed" class="text-white text-lg font-bold whitespace-nowrap">InventoryApp</span>
      </div>
    </div>
    
    <nav class="py-5 flex flex-col gap-1">
      <router-link to="/dashboard" class="flex items-center gap-3 px-5 py-3.5 text-slate-400 no-underline transition-all duration-200 relative hover:bg-white/8 hover:text-slate-200 router-link-active:bg-blue-500/15 router-link-active:text-blue-400 router-link-active:before:absolute router-link-active:before:left-0 router-link-active:before:top-0 router-link-active:before:bottom-0 router-link-active:before:w-0.5 router-link-active:before:bg-blue-500">
        <svg class="w-5 h-5 min-w-[20px] stroke-[1.5]" viewBox="0 0 24 24" fill="none" stroke="currentColor">
          <rect x="3" y="3" width="7" height="7"/>
          <rect x="14" y="3" width="7" height="7"/>
          <rect x="14" y="14" width="7" height="7"/>
          <rect x="3" y="14" width="7" height="7"/>
        </svg>
        <span v-show="!isCollapsed" class="text-sm font-medium whitespace-nowrap">Dashboard</span>
      </router-link>
      
      <router-link to="/items" class="flex items-center gap-3 px-5 py-3.5 text-slate-400 no-underline transition-all duration-200 relative hover:bg-white/8 hover:text-slate-200 router-link-active:bg-blue-500/15 router-link-active:text-blue-400 router-link-active:before:absolute router-link-active:before:left-0 router-link-active:before:top-0 router-link-active:before:bottom-0 router-link-active:before:w-0.5 router-link-active:before:bg-blue-500">
        <svg class="w-5 h-5 min-w-[20px] stroke-[1.5]" viewBox="0 0 24 24" fill="none" stroke="currentColor">
          <path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"/>
        </svg>
        <span v-show="!isCollapsed" class="text-sm font-medium whitespace-nowrap">Master Barang</span>
      </router-link>
      
      <router-link to="/items/in" class="flex items-center gap-3 px-5 py-3.5 text-slate-400 no-underline transition-all duration-200 relative hover:bg-white/8 hover:text-slate-200 router-link-active:bg-blue-500/15 router-link-active:text-blue-400 router-link-active:before:absolute router-link-active:before:left-0 router-link-active:before:top-0 router-link-active:before:bottom-0 router-link-active:before:w-0.5 router-link-active:before:bg-blue-500">
        <svg class="w-5 h-5 min-w-[20px] stroke-[1.5]" viewBox="0 0 24 24" fill="none" stroke="currentColor">
          <path d="M12 5v14m7-7l-7-7-7 7"/>
        </svg>
        <span v-show="!isCollapsed" class="text-sm font-medium whitespace-nowrap">Barang Masuk</span>
      </router-link>
      
      <router-link to="/items/out" class="flex items-center gap-3 px-5 py-3.5 text-slate-400 no-underline transition-all duration-200 relative hover:bg-white/8 hover:text-slate-200 router-link-active:bg-blue-500/15 router-link-active:text-blue-400 router-link-active:before:absolute router-link-active:before:left-0 router-link-active:before:top-0 router-link-active:before:bottom-0 router-link-active:before:w-0.5 router-link-active:before:bg-blue-500">
        <svg class="w-5 h-5 min-w-[20px] stroke-[1.5]" viewBox="0 0 24 24" fill="none" stroke="currentColor">
          <path d="M12 19V5m-7 7l7 7 7-7"/>
        </svg>
        <span v-show="!isCollapsed" class="text-sm font-medium whitespace-nowrap">Barang Keluar</span>
      </router-link>
      
      <router-link to="/reports" class="flex items-center gap-3 px-5 py-3.5 text-slate-400 no-underline transition-all duration-200 relative hover:bg-white/8 hover:text-slate-200 router-link-active:bg-blue-500/15 router-link-active:text-blue-400 router-link-active:before:absolute router-link-active:before:left-0 router-link-active:before:top-0 router-link-active:before:bottom-0 router-link-active:before:w-0.5 router-link-active:before:bg-blue-500">
        <svg class="w-5 h-5 min-w-[20px] stroke-[1.5]" viewBox="0 0 24 24" fill="none" stroke="currentColor">
          <path d="M9 17H7A5 5 0 0 1 7 7h2m0 10a5 5 0 0 1 5-5h2a5 5 0 0 1 5 5v2a5 5 0 0 1-5 5h-2a5 5 0 0 1-5-5v-2z"/>
        </svg>
        <span v-show="!isCollapsed" class="text-sm font-medium whitespace-nowrap">Laporan Stok</span>
      </router-link>
    </nav>
  </aside>
</template>

<script>
export default {
  name: 'Sidebar',
  props: {
    isCollapsed: {
      type: Boolean,
      default: false
    }
  }
}
</script>