import { createRouter, createWebHistory } from 'vue-router'
import { useLoadingStore } from '@/stores/loading'
import UserDashboard from '@/views/UserDashboard.vue'

//uses inline import with lazy load routes to speed up initial loading.
const router = createRouter({
	history: createWebHistory(import.meta.env.BASE_URL),
	routes: [
		{ path: '/', name: 'dashboard', component: UserDashboard },
		{ path: '/beans', name: 'beans', component: () => import('@/views/UserBeans.vue') },
		{ path: '/gear', name: 'gear', component: () => import('@/views/UserGear.vue') },
		{ path: '/profile', name: 'profile', component: () => import('@/views/UserProfile.vue') },
		{ path: '/about', name: 'about', component: () => import('@/views/UserAbout.vue') },

		{ path: '/:pathMatch(.*)*', redirect: '/' },
	],
})

router.beforeEach(() => {
	const loading = useLoadingStore()
	loading.start()
})

router.afterEach(() => {
	const loading = useLoadingStore()
	loading.stop()
})

export default router
