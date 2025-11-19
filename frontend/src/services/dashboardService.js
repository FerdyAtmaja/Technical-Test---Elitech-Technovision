import axios from 'axios'

const API_URL = 'http://localhost:8000/api'

export default {
  getStats() {
    return axios.get(`${API_URL}/dashboard/stats`)
  }
}