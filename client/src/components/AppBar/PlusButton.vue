<script setup lang="ts">
import { ref } from 'vue'

const open = ref<boolean>(false)
</script>

<template>
	<div class="wrapper">
		<button @click="open = !open" class="main-button">
			<span>+</span>
		</button>
	</div>
</template>

<style scoped>
.wrapper {
	position: relative;
	padding: 0;
	margin: 0;
	width: 48px;
	height: 48px;
}

.main-button {
	position: absolute;

	border-radius: 50%;
	width: 100%;
	height: 100%;

	background-color: var(--brand-400);
	box-shadow: 0 2px var(--brand-600);

	font-size: 48px;
	font-weight: 1000;
	padding: 0;
	line-height: 0;

	display: flex;
	align-items: center;
	justify-content: center;

	transition: transform 0.15s ease;
}

.main-button:hover {
	transform: scale(1.05);
}

button > span {
	margin-top: -8px;
}

.invisible {
	opacity: 0;
	pointer-events: none;
}
</style>
