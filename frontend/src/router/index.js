import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import LoginView from '../views/LoginView.vue'
import authService from '@/services/authService.js'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/login',
      name: 'login',
      component: LoginView
    },
    {
      path: '/',
      redirect: '/dashboard'
    },
    {
      path: '/dashboard',
      name: 'dashboard',
      component: HomeView,
      meta: { requiresAuth: true }
    },
    {
      path: '/items',
      name: 'items',
      component: () => import('../views/ItemsView.vue'),
      meta: { requiresAuth: true, roles: ['admin', 'manager'] }
    },
    {
      path: '/items/in',
      name: 'items-in',
      component: () => import('../views/ItemsInView.vue'),
      meta: { requiresAuth: true }
    },
    {
      path: '/items/out',
      name: 'items-out',
      component: () => import('../views/ItemsOutView.vue'),
      meta: { requiresAuth: true }
    },
    {
      path: '/reports',
      name: 'reports',
      component: () => import('../views/ReportsView.vue'),
      meta: { requiresAuth: true, roles: ['admin', 'manager'] }
    }
  ]
})

router.beforeEach((to, from, next) => {
  if (to.meta.requiresAuth && !authService.isAuthenticated()) {
    next('/login')
  } else if (to.meta.roles && !authService.canAccess(to.meta.roles)) {
    next('/dashboard')
  } else if (to.path === '/login' && authService.isAuthenticated()) {
    next('/dashboard')
  } else {
    next()
  }
})

export default router