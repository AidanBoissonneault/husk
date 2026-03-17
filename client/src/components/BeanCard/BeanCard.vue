<script setup lang="ts">
import BeanCardInfo from './BeanCardInfo.vue'
import BeanCardWrapper from './BeanCardWrapper.vue'

const fakeBeanCard = {
	name: 'Bean Um Coffee',
	variety: 'Red Catuai Natural Musto CM',
	origin: 'Kenya',
	maslRange: '1800 - 1900',
	flavorProfile: 'Peach, Pizza, Melt, Fire',
}
</script>

<template>
	<BeanCardWrapper>
		<BeanCardInfo
			:name="fakeBeanCard.name"
			:variety="fakeBeanCard.variety"
			:masl-range="fakeBeanCard.maslRange"
			:flavor-profile="fakeBeanCard.flavorProfile"
			:origin="fakeBeanCard.origin"
		/>
	</BeanCardWrapper>
</template>

<style scoped></style>
