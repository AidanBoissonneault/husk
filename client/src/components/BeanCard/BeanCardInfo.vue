<script setup lang="ts">
// eslint-disable-next-line @typescript-eslint/no-unused-vars
const props = defineProps<{
	name: string
	variety: string
	origin: string
	maslRange: string
	flavorProfile: string
}>()
</script>

<template>
	<div>
		<h2>{{ name }}</h2>
		<p>
			{{ variety }} <br />
			{{ origin }}, {{ maslRange }} MASL <br />
			{{ flavorProfile }}
		</p>
	</div>
</template>

<style scoped>
div {
	--pico-color: var(--neutral-800);
}

h2 {
	margin: 0;
	margin-bottom: 4px;
}
</style>
