<template>
  <div v-if="show" class="fixed inset-0 bg-black bg-opacity-20 flex items-center justify-center z-50">
    <div class="bg-white rounded-lg p-6 w-full max-w-sm">
      <div class="flex items-center gap-3 mb-4">
        <div :class="iconClass">
          <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20">
            <path v-if="type === 'success'" fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
            <path v-else-if="type === 'error'" fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
          </svg>
        </div>
        <h3 class="text-lg font-semibold text-gray-900">{{ title }}</h3>
      </div>
      
      <p class="text-gray-600 mb-6">{{ message }}</p>
      
      <div class="flex justify-end">
        <button 
          @click="$emit('close')"
          class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700"
        >
          OK
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'NotificationModal',
  props: {
    show: Boolean,
    type: {
      type: String,
      default: 'success'
    },
    title: String,
    message: String
  },
  emits: ['close'],
  computed: {
    iconClass() {
      return {
        'text-green-600': this.type === 'success',
        'text-red-600': this.type === 'error'
      }
    }
  }
}
</script>