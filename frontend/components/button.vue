<template>
  <button
    class="text-white font-bold shadow-md px-12 py-3 rounded-lg uppercase"
    @click="$emit('click', $event)"
  >
    <slot />
  </button>
</template>
