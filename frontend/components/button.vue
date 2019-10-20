<template>
  <button
    class="text-white shadow-md px-12 py-1 rounded-lg uppercase"
    @click="$emit('click', $event)"
  >
    <slot />
  </button>
</template>
