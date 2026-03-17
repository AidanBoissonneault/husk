<script setup lang="ts"></script>

<template>
	<div class="bean-card">
		<slot />
	</div>
</template>

<style scoped>
.bean-card {
	grid-column: 1 / 5;
	background-color: var(--green-600);

	border-radius: 12px;
	box-shadow: 0px 2px var(--green-800);
	padding: 12px;
}
</style>
