import axios from 'axios'

const API_URL = 'http://localhost:8000/api'

export default {
  getStockReport(params = {}) {
    return axios.get(`${API_URL}/reports/stock`, { params })
  }
}