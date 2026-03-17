<script setup lang="ts">
</script>

<template>
  <div class="pour-loader">
    <svg viewBox="0 0 64 64" class="loader-svg">
      <path
        class="droplet"
        d="M32 12 C28 20, 28 24, 32 28 C36 24, 36 20, 32 12 Z"
      />

      <circle
        class="ripple"
        cx="32"
        cy="40"
        r="2"
        stroke-width="2"
        fill="none"
      />

      <path
        class="swirl"
        d="M28 36 C26 32, 30 28, 32 24 C34 20, 38 18, 40 20"
        stroke-width="2"
        fill="none"
        stroke-linecap="round"
      />
    </svg>
  </div>
</template>

<style scoped>
.pour-loader {
  width: 64px;
  height: 64px;
  display: flex;
  justify-content: center;
  align-items: center;

	transform: scale(5);
}

.loader-svg {
  width: 100%;
  height: 100%;
  stroke: var(--coffee, #6b4f3a);
  fill: var(--coffee, #6b4f3a);
}

.droplet {
  animation: droplet-fall 1.6s ease-in-out infinite;
  transform-origin: center;
}

@keyframes droplet-fall {
  0%   { transform: translateY(0) scale(0.9); opacity: 0.8; }
  20%  { transform: translateY(0) scale(1);   opacity: 1; }
  40%  { transform: translateY(20px);         opacity: 1; }
  45%  { opacity: 0; }
  100% { opacity: 0; transform: translateY(0); }
}

/* Ripple animation */
.ripple {
  stroke: var(--coffee, #6b4f3a);
  animation: ripple-expand 1.6s ease-out infinite;
  transform-origin: center;
}

@keyframes ripple-expand {
  0%, 40% { r: 0; opacity: 0; }
  45%     { r: 2; opacity: 0.8; }
  100%    { r: 14; opacity: 0; }
}

/* Swirl animation */
.swirl {
  stroke: var(--coffee, #6b4f3a);
  animation: swirl-rise 1.6s ease-in-out infinite;
  transform-origin: center;
}

@keyframes swirl-rise {
  0%, 45% { opacity: 0; transform: translateY(0); }
  60%     { opacity: 0.8; transform: translateY(-4px); }
  100%    { opacity: 0; transform: translateY(-10px); }
}
</style>
