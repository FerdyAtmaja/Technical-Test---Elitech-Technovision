<template>
  <aside class="fixed top-0 left-0 z-40 h-screen transition-all duration-300" :class="isCollapsed ? 'w-[70px]' : 'w-64'" style="background: #0E1F34;">
    <div class="p-5 border-b border-white/10">
      <div class="flex items-center gap-3">
        <div class="w-8 h-8 bg-blue-600 rounded-lg flex items-center justify-center min-w-[32px]">
          <span class="text-white text-lg font-bold">IA</span>
        </div>
        <span v-show="!isCollapsed" class="text-white text-lg font-bold whitespace-nowrap">InventoryApp</span>
      </div>
    </div>
    
    <nav class="py-5 flex flex-col gap-1">
      <router-link to="/dashboard" class="flex items-center gap-3 px-5 py-3.5 text-slate-400 no-underline transition-all duration-200 relative hover:bg-white/8 hover:text-slate-200 router-link-active:bg-blue-500/15 router-link-active:text-blue-400 router-link-active:before:absolute router-link-active:before:left-0 router-link-active:before:top-0 router-link-active:before:bottom-0 router-link-active:before:w-0.5 router-link-active:before:bg-blue-500">
        <svg class="w-5 h-5 min-w-[20px] stroke-[1.5]" viewBox="0 0 24 24" fill="none" stroke="currentColor">
          <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/>
          <polyline points="9,22 9,12 15,12 15,22"/>
        </svg>
        <span v-show="!isCollapsed" class="text-sm font-medium whitespace-nowrap">Dashboard</span>
      </router-link>
      
      <router-link to="/items" class="flex items-center gap-3 px-5 py-3.5 text-slate-400 no-underline transition-all duration-200 relative hover:bg-white/8 hover:text-slate-200" active-class="bg-blue-500/15 text-blue-400 before:absolute before:left-0 before:top-0 before:bottom-0 before:w-0.5 before:bg-blue-500">
        <svg class="w-5 h-5 min-w-[20px] stroke-[1.5]" viewBox="0 0 24 24" fill="none" stroke="currentColor">
          <rect x="2" y="3" width="20" height="14" rx="2" ry="2"/>
          <line x1="8" y1="21" x2="16" y2="21"/>
          <line x1="12" y1="17" x2="12" y2="21"/>
        </svg>
        <span v-show="!isCollapsed" class="text-sm font-medium whitespace-nowrap">Master Barang</span>
      </router-link>
      
      <router-link to="/items/in" class="flex items-center gap-3 px-5 py-3.5 text-slate-400 no-underline transition-all duration-200 relative hover:bg-white/8 hover:text-slate-200" active-class="bg-blue-500/15 text-blue-400 before:absolute before:left-0 before:top-0 before:bottom-0 before:w-0.5 before:bg-blue-500">
        <svg class="w-5 h-5 min-w-[20px] stroke-[1.5]" viewBox="0 0 24 24" fill="none" stroke="currentColor">
          <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
          <polyline points="14,2 14,8 20,8"/>
          <line x1="12" y1="11" x2="12" y2="17"/>
          <polyline points="9,14 12,11 15,14"/>
        </svg>
        <span v-show="!isCollapsed" class="text-sm font-medium whitespace-nowrap">Barang Masuk</span>
      </router-link>
      
      <router-link to="/items/out" class="flex items-center gap-3 px-5 py-3.5 text-slate-400 no-underline transition-all duration-200 relative hover:bg-white/8 hover:text-slate-200 router-link-active:bg-blue-500/15 router-link-active:text-blue-400 router-link-active:before:absolute router-link-active:before:left-0 router-link-active:before:top-0 router-link-active:before:bottom-0 router-link-active:before:w-0.5 router-link-active:before:bg-blue-500">
        <svg class="w-5 h-5 min-w-[20px] stroke-[1.5]" viewBox="0 0 24 24" fill="none" stroke="currentColor">
          <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
          <polyline points="14,2 14,8 20,8"/>
          <line x1="12" y1="17" x2="12" y2="11"/>
          <polyline points="15,14 12,17 9,14"/>
        </svg>
        <span v-show="!isCollapsed" class="text-sm font-medium whitespace-nowrap">Barang Keluar</span>
      </router-link>
      
      <router-link to="/reports" class="flex items-center gap-3 px-5 py-3.5 text-slate-400 no-underline transition-all duration-200 relative hover:bg-white/8 hover:text-slate-200 router-link-active:bg-blue-500/15 router-link-active:text-blue-400 router-link-active:before:absolute router-link-active:before:left-0 router-link-active:before:top-0 router-link-active:before:bottom-0 router-link-active:before:w-0.5 router-link-active:before:bg-blue-500">
        <svg class="w-5 h-5 min-w-[20px] stroke-[1.5]" viewBox="0 0 24 24" fill="none" stroke="currentColor">
          <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
          <polyline points="14,2 14,8 20,8"/>
          <line x1="16" y1="13" x2="8" y2="13"/>
          <line x1="16" y1="17" x2="8" y2="17"/>
          <polyline points="10,9 9,9 8,9"/>
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