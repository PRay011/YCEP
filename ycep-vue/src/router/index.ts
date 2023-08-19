import {createRouter, createWebHistory} from 'vue-router'

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
            path: '/knowledge/kind/:kindID',
            name: 'knowledgek/kind',
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

    ],
    scrollBehavior(to, from, savedPosition) {
        //if判断可加可不加、根据自己需求
        //savedPosition当且仅当通过浏览器的前进/后退按钮触发时才可用
        if (savedPosition) {
            return savedPosition
        }
        return {
            x: 0,
            y: 0
        }
    }

})

export default router
