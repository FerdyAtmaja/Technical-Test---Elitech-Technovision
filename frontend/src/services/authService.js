import axios from 'axios'

const API_URL = 'http://localhost:8000/api'

// Add response interceptor to handle 401 errors
axios.interceptors.response.use(
  response => response,
  error => {
    if (error.response?.status === 401) {
      authService.logout()
      window.location.href = '/login'
    }
    return Promise.reject(error)
  }
)

const authService = {
  async login(credentials) {
    try {
      const response = await axios.post(`${API_URL}/login`, credentials)
      if (response.data.success) {
        localStorage.setItem('token', response.data.token)
        localStorage.setItem('user', JSON.stringify(response.data.user))
        axios.defaults.headers.common['Authorization'] = `Bearer ${response.data.token}`
      }
      return response.data
    } catch (error) {
      console.error('Login error:', error)
      throw error
    }
  },

  async logout() {
    try {
      await axios.post(`${API_URL}/logout`)
    } catch (error) {
      console.error('Logout error:', error)
    } finally {
      localStorage.removeItem('token')
      localStorage.removeItem('user')
      delete axios.defaults.headers.common['Authorization']
    }
  },

  async me() {
    const response = await axios.get(`${API_URL}/me`)
    return response.data
  },

  getToken() {
    return localStorage.getItem('token')
  },

  getUser() {
    const user = localStorage.getItem('user')
    return user ? JSON.parse(user) : null
  },

  isAuthenticated() {
    return !!this.getToken()
  },

  hasRole(role) {
    const user = this.getUser()
    return user && user.role === role
  },

  canAccess(allowedRoles) {
    const user = this.getUser()
    return user && allowedRoles.includes(user.role)
  }
}

// Set token on app start
const token = authService.getToken()
if (token) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
}

export default authService