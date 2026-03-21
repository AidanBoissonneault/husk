<script setup lang="ts">
import BeanForm from '@/components/BeanForm/BeanForm.vue';
import type { AddBeanForm } from '@/types';
import { ref } from 'vue';

const bean = ref<AddBeanForm>()
</script>

<template>
	<div class="dashboard">
		<BeanForm v-model="bean"/>
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
