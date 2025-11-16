<template>
  <div class="min-h-screen flex items-center justify-center bg-gray-50">
    <div class="max-w-md w-full space-y-8">
      <div>
        <div class="mx-auto h-12 w-12 flex items-center justify-center">
          <div class="w-8 h-8 bg-blue-600 rounded-lg flex items-center justify-center min-w-[32px]">
            <span class="text-white text-lg font-bold">IA</span>
          </div>
        </div>
        <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">
          Login ke InventoryApp
        </h2>
      </div>
      <form class="mt-8 space-y-6" @submit.prevent="handleLogin">
        <div class="rounded-md shadow-sm -space-y-px">
          <div>
            <input
              v-model="form.email"
              type="email"
              required
              class="relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-blue-500 focus:border-blue-500"
              placeholder="Email"
            />
          </div>
          <div>
            <input
              v-model="form.password"
              type="password"
              required
              class="relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-blue-500 focus:border-blue-500"
              placeholder="Password"
            />
          </div>
        </div>

        <div v-if="error" class="text-red-600 text-sm text-center">
          {{ error }}
        </div>

        <div>
          <button
            type="submit"
            :disabled="loading"
            class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 disabled:opacity-50"
          >
            {{ loading ? 'Loading...' : 'Login' }}
          </button>
        </div>

        <div class="text-sm text-gray-600">
          <p class="font-medium">Demo Accounts:</p>
          <p>Admin: admin@inventory.com / admin123</p>
          <p>Manager: manager@inventory.com / manager123</p>
          <p>Staff: staff@inventory.com / staff123</p>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import authService from '@/services/authService.js'

export default {
  name: 'LoginView',
  data() {
    return {
      form: {
        email: '',
        password: ''
      },
      loading: false,
      error: ''
    }
  },
  methods: {
    async handleLogin() {
      this.loading = true
      this.error = ''
      
      try {
        const response = await authService.login(this.form)
        if (response.success) {
          this.$router.push('/dashboard')
        } else {
          this.error = response.message
        }
      } catch (error) {
        this.error = error.response?.data?.message || 'Login gagal'
      } finally {
        this.loading = false
      }
    }
  }
}
</script>