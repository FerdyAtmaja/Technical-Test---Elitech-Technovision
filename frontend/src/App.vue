<template>
  <AppLayout>
    <RouterView />
  </AppLayout>
</template>

<script>
import AppLayout from '@/layouts/AppLayout.vue'
import { RouterView } from 'vue-router'

export default {
  name: 'App',
  components: {
    AppLayout,
    RouterView
  }
}
</script>
