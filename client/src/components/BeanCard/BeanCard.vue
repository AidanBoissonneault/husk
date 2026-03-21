<script setup lang="ts">
import BeanCardInfo from './BeanCardInfo.vue'
import BeanCardWrapper from './BeanCardWrapper.vue'
import { type Bean } from '@/types';

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
</script>

<template>
	<BeanCardWrapper :bean="bean">
		<BeanCardInfo
			:bean="bean"
		/>
	</BeanCardWrapper>
</template>

<style scoped></style>
