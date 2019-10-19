<template>
  <button
    class="text-white shadow-md px-12 py-1 rounded-lg uppercase"
    @click="emit('clicked', $event)"
  >
    <slot />
  </button>
</template>
