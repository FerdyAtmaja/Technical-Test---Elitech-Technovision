import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      redirect: '/dashboard'
    },
    {
      path: '/dashboard',
      name: 'dashboard',
      component: HomeView
    },
    {
      path: '/items',
      name: 'items',
      component: () => import('../views/ItemsView.vue')
    },
    {
      path: '/items/in',
      name: 'items-in',
      component: () => import('../views/ItemsInView.vue')
    },
    {
      path: '/items/out',
      name: 'items-out',
      component: () => import('../views/ItemsOutView.vue')
    },
    {
      path: '/reports',
      name: 'reports',
      component: () => import('../views/ReportsView.vue')
    }
  ]
})

export default router