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
      name: 'interaction',
      component: () => import('../views/game/interaction.vue')
    },
    {
      path: '/game/main/:id',
      name: 'gameMain',
      component: () => import('../views/game/main.vue')
    },
    {
      path: '/game/review',
      name: 'review',
      component: () => import('../views/game/review.vue')
    },
    {
      path: '/game/room',
      name: 'room',
      component: () => import('../views/game/room.vue')
    },
    {
      path: '/knowledge/detail/:id',
      name: 'knowledgeDetail',
      component: () => import('../views/knowledge/detail.vue')
    },
    {
      path: '/knowledge/index',
      name: 'knowledgeIndex',
      component: () => import('../views/knowledge/index.vue')
    },
    {
      path: '/knowledge/kind/:kind',
      name: 'knowledgekKind',
      component: () => import('../views/knowledge/kind.vue')
    },
    {
      path: '/managenent/statistics',
      name: 'statistics',
      component: () => import('../views/management/statistics.vue')
    },
    {
      path: '/user/login',
      name: 'login',
      component: () => import('../views/user/login.vue')
    },
    {
      path: '/user/register',
      name: 'register',
      component: () => import('../views/user/register.vue')
    },
    {
      path: '/user/selfCenter',
      name: 'selfCenter',
      component: () => import('../views/user/selfCenter.vue')
    },
    {
      path: '/user/thesis',
      name: 'thesis',
      component: () => import('../views/user/thesis.vue')
    }

  ]
})

export default router
