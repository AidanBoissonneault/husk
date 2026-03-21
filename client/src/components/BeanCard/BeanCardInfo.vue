<script setup lang="ts">
import type { Bean } from '@/types';

// eslint-disable-next-line @typescript-eslint/no-unused-vars
const props = defineProps<{
	bean: Bean
}>()
</script>

<template>
	<div>
		<h2>{{ bean.name }}</h2>
		<p>
			{{ bean.variety }}<span v-if="!!bean.process">, {{ bean.process }}</span> <br />
			{{ bean.origin }}<span v-if="!!bean.elevation_m">, {{ bean.elevation_m }} MASL</span> <br />
			{{ bean.flavour_summary }}
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
