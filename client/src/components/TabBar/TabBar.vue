<script setup lang="ts">
import { computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import type { TabButton } from '@/types'
import TabIcon from './TabIcon.vue'

const tabs = <TabButton[]>[
	{ icon: 'house', text: 'Dashboard', route: 'dashboard' },
	{ icon: 'mug-saucer', text: 'Beans', route: 'beans' },
	{ icon: 'gear', text: 'Gear', route: 'gear' },
]

const route = useRoute()
const router = useRouter()

function navigate(route: string) {
	router.push({ name: route });
}

const activePage = computed(() => route.name?.toString().toLowerCase() ?? '')
</script>

<template>
	<footer>
		<TabIcon v-for="(tab, i) in tabs" :key="i" :icon="tab.icon" :text="tab.text" :route="tab.route"
			:activePage="activePage" @navigate="navigate" />
	</footer>
</template>

<style scoped>
footer {
	position: fixed;
	bottom: 0;

	width: calc(100% - (2 * 24px));
	height: auto;

	background-color: var(--brand-300);
	margin: 24px;

	display: grid;
	grid-template-columns: repeat(3, 1fr);

	border-radius: 12px;
	box-shadow: 0px 2px var(--brand-600);

	z-index: 999;
}
</style>
