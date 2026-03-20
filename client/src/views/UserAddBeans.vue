<script setup lang="ts">
import BeanForm from '@/components/BeanForm/BeanForm.vue';


</script>

<template>
	<div class="dashboard">
		<BeanForm />
	</div>
</template>

<style scoped>
.dashboard {
	display: grid;
	gap: 16px;
	grid-template-columns: repeat(4, 1fr);
	margin-left: 24px;
	margin-right: 24px;

	overflow: visible;
}
</style>
