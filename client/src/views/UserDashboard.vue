<script setup lang="ts">
import BeanCard from '@/components/BeanCard/BeanCard.vue'
import HeroBeanCard from '@/components/BeanCard/HeroBeanCard.vue'
import SectionSeperator from '@/components/SectionSeperator.vue'
</script>

<template>
	<div class="dashboard">
		<HeroBeanCard />
		<SectionSeperator />
		<div class="filter-wrapper">
			<h5>Beans</h5>
			<div class="filter-buttons">
				<button>Fresh</button>
				<button>Frozen</button>
				<button>All</button>
			</div>
		</div>
		<BeanCard />
		<BeanCard />
		<BeanCard />
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

.filter-wrapper {
	display: flex;
	justify-content: space-between;
	align-content: center;

	grid-column: 1 / 5;
}

.filter-buttons {
	display: flex;
	justify-content: center;
	align-content: center;
}

.filter-buttons > * {
	padding: 0;
	margin: 0;
	padding-left: 4px;
	padding-right: 4px;
	margin-left: 4px;

	background-color: var(--brand-300);
}

h5 {
	margin: 0;
	margin-left: 4px;
	padding: 0;
	line-height: 1;

	color: var(--brand-200);
}
</style>
