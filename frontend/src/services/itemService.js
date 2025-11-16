import axios from 'axios'

const API_URL = 'http://localhost:8000/api'

export default {
  getAll(params = {}) {
    return axios.get(`${API_URL}/items`, { params })
  },
  
  getById(id) {
    return axios.get(`${API_URL}/items/${id}`)
  },
  
  create(data) {
    return axios.post(`${API_URL}/items`, data)
  },
  
  update(id, data) {
    return axios.put(`${API_URL}/items/${id}`, data)
  },
  
  delete(id) {
    return axios.delete(`${API_URL}/items/${id}`)
  },
  
  getNextCode() {
    return axios.get(`${API_URL}/items-next-code`)
  },
  
  checkTransactions(id) {
    return axios.get(`${API_URL}/items/${id}/check-transactions`)
  },
  
  getUnits() {
    return axios.get(`${API_URL}/items-units`)
  }
}