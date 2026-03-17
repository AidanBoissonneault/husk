<script setup lang="ts">
import { computed } from 'vue'
import { useRouter, useRoute } from 'vue-router'

const router = useRouter()
const route = useRoute()

const PAGE_NAME = 'profile'
const isActivePage = computed(() => route.name === PAGE_NAME)

function navigate() {
	router.push({ name: PAGE_NAME })
}
</script>

<template>
	<button @click="navigate" :class="{ isActive: isActivePage }">
		<FontAwesomeIcon :icon="['fas', 'circle-user']" />
	</button>
</template>

<style scoped>
button {
	border-radius: 50%;
	width: 40px;
	height: 40px;

	background-color: var(--brand-600);
	box-shadow: 0 2px var(--brand-700);

	padding: 2px;

	display: flex;
	align-items: center;
	justify-content: center;

	transition: transform 0.15s ease;
}

button:hover {
	transform: scale(1.1);
}

button svg {
	font-size: 24px;
}

.isActive {
	transform: scale(1.15);
}
</style>
