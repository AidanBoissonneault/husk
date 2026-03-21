<script setup lang="ts">
import type { AddBeanForm } from '@/types'
import { watch, ref } from 'vue'

// support v-model
const modelValue = defineModel<AddBeanForm>({
	default: {
		name: undefined,
		roaster: undefined,
		origin: undefined,
		variety: undefined,
		process: undefined,
		roastLevel: 50,
		state: "fresh",
		flavourNotes: undefined,
	}
})

const emits = defineEmits<{
	formSubmitted: []
}>()


// clone the modelValue to local data
// and provide a fallback user if none provided
const form = ref(clone(modelValue.value))

// only update the modelValue when the form is submitted
function handleSubmit() {
	modelValue.value = clone(form.value)
	emits('formSubmitted')
}

// reset form when prop changes
watch(modelValue, () => {
	form.value = clone(modelValue.value)
}, { deep: true })

function clone(obj: AddBeanForm) {
	return JSON.parse(JSON.stringify(obj))
}
</script>

<template>
	<form @submit.prevent="handleSubmit">
		<label class="large">
			Name: *
			<input type="text" v-model="form.name" required>
		</label>

		<label>
			Roaster
			<input type="text" v-model="form.roaster">
		</label>
		<label>
			Origin
			<input type="text" v-model="form.origin">
		</label>

		<label>
			Variety
			<input type="text" v-model="form.variety">
		</label>
		<label>
			Process
			<input type="text" v-model="form.process">
		</label>

		<label>
			State
			<select>
				<option value="fresh">Fresh</option>
				<option value="frozen">Frozen</option>
				<option value="finished">Finished</option>
			</select>
		</label>
		<label class="centered">
			<div class="seperated">
				<span>Light</span>
				<span>Roast Level</span>
				<span>Dark</span>
			</div>
			<input type="range" min="0" max="100" value="50" class="slider" v-model="form.roastLevel">
		</label>

		<label class="large">
			Flavour Notes
			<input type="text" v-model="form.flavourNotes">
		</label>

		<button :disabled="! !!form.name.trim()">Submit</button>
	</form>
</template>

<style scoped>
button {
	grid-column: span 4;
}
form {
	display: contents;
}

label {
	grid-column: span 2;
}

label.centered {
	display: flex;
	flex-direction: column;
	align-items: center;
}

label.large {
	grid-column: span 4;
}

.seperated {
	display: flex;
	justify-content: space-between;
	width: 100%;
}
</style>
