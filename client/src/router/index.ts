import { createRouter, createWebHistory } from 'vue-router'
import { useLoadingStore } from '@/stores/loading'
import UserDashboard from '@/views/UserDashboard.vue'

// uses inline loading on main route to load main route quicker
// uses lazy routing with alternate paths to speed up initial load.
const router = createRouter({
	history: createWebHistory(import.meta.env.BASE_URL),
	routes: [
		{ path: '/', name: 'dashboard', component: UserDashboard },
		{ path: '/addbeans', name: 'addbeans', component: () => import('@/views/UserAddBeans.vue') },
		{ path: '/gear', name: 'gear', component: () => import('@/views/UserGear.vue') },
		{ path: '/profile', name: 'profile', component: () => import('@/views/UserProfile.vue') },
		{ path: '/about', name: 'about', component: () => import('@/views/UserAbout.vue') },

		{ path: '/:pathMatch(.*)*', redirect: '/' },
	],
})

// starts a loading screen when a new page is loading
router.beforeEach(() => {
	const loading = useLoadingStore()
	loading.start()
})

// ends the loading screen when the new page is loaded
router.afterEach(() => {
	const loading = useLoadingStore()
	loading.stop()
})

export default router
