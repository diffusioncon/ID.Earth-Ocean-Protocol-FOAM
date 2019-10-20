<template>
  <div class="max-h-screen font-special relative">
    <c-header class="absolute w-screen h-screen"></c-header>
    <nuxt class="h-full z-10 relative" />
  </div>
</template>

<script>
import cHeader from '~/components/header'
export default {
  mounted() {
    this.$store.dispatch('chain/init')
  },
  components: {
    cHeader
  }
}
</script>
