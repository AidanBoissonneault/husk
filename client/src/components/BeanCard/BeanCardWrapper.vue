<script setup lang="ts">
import { computed, onMounted, ref } from 'vue';
import type { Bean } from '@/types';

const props = defineProps<{
	bean: Bean
}>()

const lightness = ref('0.7') // fallback default

onMounted(() => {
  lightness.value = getComputedStyle(document.documentElement)
    .getPropertyValue('--lightness')
    .trim()
})

const priColor = computed(() =>
  `oklch(${lightness.value} ${props.bean.pri_chroma} ${props.bean.pri_hue})`
)
const priColorShadow = computed(() =>
  `oklch(${Number(lightness.value) - 0.15} ${props.bean.pri_chroma} ${props.bean.pri_hue})`
)
const secColor = computed(() =>
  `oklch(${lightness.value} ${props.bean.sec_chroma} ${props.bean.sec_hue})`
)
const accColor = computed(() =>
  `oklch(${lightness.value} ${props.bean.acc_chroma} ${props.bean.acc_hue})`
)
</script>

<template>
	<div class="bean-card">
		<slot />
	</div>
</template>

<style scoped>
.bean-card {
  grid-column: 1 / 5;
  border-radius: 12px;
  box-shadow: 0px 2px v-bind(priColorShadow);
  padding: 12px;
  position: relative;
  overflow: hidden;
  background-color: v-bind(priColor);
  background-image:
    radial-gradient(ellipse 60% 80% at 15% 50%,   v-bind(priColor) 0%, transparent 100%),
    radial-gradient(ellipse 55% 90% at 50% 60%,   v-bind(secColor) 0%, transparent 100%),
    radial-gradient(ellipse 60% 80% at 85% 40%,   v-bind(accColor) 0%, transparent 100%);
}
</style>
