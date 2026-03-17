<script setup lang="ts">
import { computed } from 'vue'

const props = defineProps<{
	icon: string
	text: string
	route: string
	activePage: string
}>()

const emit = defineEmits<{
	navigate: [route: string]
}>()

const isActive = computed(() => props.route === props.activePage)
console.log(isActive)
</script>

<template>
	<button @click="emit('navigate', route)" :class="{ active_tab: isActive }">
		<FontAwesomeIcon :icon="['fas', icon]" />
		<span>{{ text }}</span>
	</button>
</template>

<style scoped>
button {
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;

	border: none;
	background-color: transparent;

	border-radius: 12px;

	box-shadow: none;
}

button:hover {
	background-color: var(--brand-600);
}

.active_tab {
	background-color: var(--brand-400);
}
</style>
