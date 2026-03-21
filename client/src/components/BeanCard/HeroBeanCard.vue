<script setup lang="ts">
import { reactive } from 'vue'
import BeanCardInfo from './BeanCardInfo.vue'
import BeanCardWrapper from './BeanCardWrapper.vue'
import QuickAccessButton from './QuickAccessButton.vue'
import { type Bean } from '@/types'
/*
const fakeBeanCard = {
	name: 'Bean Um Coffee',
	variety: 'Red Catuai Natural Musto CM',
	origin: 'Kenya',
	maslRange: '1800 - 1900',
	flavorProfile: 'Peach, Pizza, Melt, Fire',
}*/

// eslint-disable-next-line @typescript-eslint/no-unused-vars
const props = defineProps<{
	bean: Bean
}>()

const buttons = reactive([{ text: 'Pourover' }, { text: 'Sprover' }])
</script>

<template>
	<BeanCardWrapper :bean="bean">
		<BeanCardInfo
			:bean="bean"
		/>
		<div class="button-wrapper">
			<QuickAccessButton v-for="(btn, i) in buttons" :text="btn.text" :key="i" />
		</div>
	</BeanCardWrapper>
</template>

<style scoped>
.button-wrapper {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 16px;

	margin-top: 4px;
}
</style>
