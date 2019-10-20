<template>
  <div class="bg-verlauf h-header flex justify-center p-4">
    <div class="text-white text-2xl font-bold uppercase mt-12">{{ text }}</div>
  </div>
</template>

<script>
export default {
  computed: {
    text() {
      return this.$store.state.header
    }
  },
}
</script>

<style>
.bg-verlauf {
  background: linear-gradient(to left top, #2EE3FF, #5351FD);
}

.h-header {
  height: 45vh
}
</style>
