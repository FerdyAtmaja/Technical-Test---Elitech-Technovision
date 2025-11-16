import axios from 'axios'

const API_URL = 'http://localhost:8000/api'

export default {
  getAll(params = {}) {
    return axios.get(`${API_URL}/transactions`, { params })
  },
  
  create(data) {
    return axios.post(`${API_URL}/transactions`, data)
  },
  
  update(id, data) {
    return axios.put(`${API_URL}/transactions/${id}`, data)
  },
  
  delete(id) {
    return axios.delete(`${API_URL}/transactions/${id}`)
  },
  
  cancel(id) {
    return axios.patch(`${API_URL}/transactions/${id}/cancel`)
  },
  
  restore(id) {
    return axios.patch(`${API_URL}/transactions/${id}/restore`)
  }
}