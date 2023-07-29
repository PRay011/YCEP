import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: () => import('../views/HomeView.vue')
    },
    {
      path: '/about',
      name: 'about',
      component: () => import('../views/AboutView.vue')
    },
    {
      path: '/game/interaction',
      name: '/game/interaction',
      component: () => import('../views/game/interaction.vue')
    },
    {
      path: '/game/main',
      name: '/game/main',
      component: () => import('../views/game/main.vue')
    },
    {
      path: '/game/review',
      name: '/game/review',
      component: () => import('../views/game/review.vue')
    },
    {
      path: '/game/room',
      name: '/game/room',
      component: () => import('../views/game/room.vue')
    },
    {
      path: '/knowledge/detail',
      name: '/knowledge/detail',
      component: () => import('../views/knowledge/detail.vue')
    },
    {
      path: '/knowledge/index',
      name: '/knowledge/index',
      component: () => import('../views/knowledge/index.vue')
    },
    {
      path: '/managenent/statistics',
      name: '/managenent/statistics',
      component: () => import('../views/management/statistics.vue')
    },
    {
      path: '/user/login',
      name: '/user/login',
      component: () => import('../views/user/login.vue')
    },
    {
      path: '/user/register',
      name: '/user/register',
      component: () => import('../views/user/register.vue')
    },
    {
      path: '/user/selfCenter',
      name: '/user/selfCenter',
      component: () => import('../views/user/selfCenter.vue')
    },
    {
      path: '/user/thesis',
      name: '/user/thesis',
      component: () => import('../views/user/thesis.vue')
    }

  ]
})

export default router
