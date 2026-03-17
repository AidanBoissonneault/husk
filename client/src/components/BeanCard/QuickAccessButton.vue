<script setup lang="ts">
// eslint-disable-next-line @typescript-eslint/no-unused-vars
const props = defineProps<{
	text: string
}>()
</script>

<template>
	<button>{{ text }}</button>
</template>

<style scoped>
button {
	border-radius: 12px;
	box-shadow: 0 2px var(--brand-500);

	font-size: 24px;
	font-weight: 700;
	padding: 4px;
}
</style>
