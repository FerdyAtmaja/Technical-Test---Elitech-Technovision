<template>
  <AppLayout v-if="showLayout">
    <RouterView />
  </AppLayout>
  <RouterView v-else />
</template>

<script>
import AppLayout from '@/layouts/AppLayout.vue'
import { RouterView } from 'vue-router'
import authService from '@/services/authService.js'

export default {
  name: 'App',
  components: {
    AppLayout,
    RouterView
  },
  computed: {
    showLayout() {
      return this.$route.path !== '/login' && authService.isAuthenticated()
    }
  }
}
</script>
