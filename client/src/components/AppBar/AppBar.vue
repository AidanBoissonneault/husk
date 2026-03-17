<script setup lang="ts">
import PlusButton from './PlusButton.vue'
import ProfileIcon from './ProfileIcon.vue'

import { useRoute } from 'vue-router'
import { computed } from 'vue'

const route = useRoute()
const isDisplayPage = computed(() => route.name === 'dashboard' || route.name === 'beans')
</script>

<template>
	<TransitionGroup name="slide" tag="header">
		<PlusButton v-if="isDisplayPage" :key="1" />
		<img v-else src="@/assets/images/title-image.PNG" alt="" />
		<h1 :key="2">Husk</h1>
		<ProfileIcon :key="3" />
	</TransitionGroup>
</template>

<style scoped>
header {
	position: fixed;
	width: calc(100% - (2 * 24px));
	height: auto;

	background-color: var(--neutral-800);
	margin-top: 20px;
	margin-left: 24px;
	margin-right: 24px;
	margin-bottom: 12px;
	padding-left: 24px;
	padding-right: 24px;
	padding-top: 10px;
	padding-bottom: 10px;

	display: flex;
	align-items: center;
	justify-content: space-between;

	border-radius: 12px;
	box-shadow: 0px 2px var(--neutral-900);

	z-index: 99999;
}

img {
	width: 48px;
	height: 48px;
}

h1 {
	text-shadow: 0px 2px var(--brand-500);
	padding: 0;
	margin: 0;
	font-weight: bold;

	--pico-font-size: 2.5rem;
	--pico-line-height: 1.125;
	--pico-typography-spacing-top: 3rem;
}

.slide-move {
	transition: transform 0.25s ease;
}

.slide-enter-active,
.slide-leave-active {
	transition: all 0.25s ease;
}

.slide-enter-from,
.slide-leave-to {
	opacity: 0;
	transform: scale(0.9);
}

.slide-leave-active {
	position: absolute;
}
</style>
