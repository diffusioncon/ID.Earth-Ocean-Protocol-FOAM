<template>
  <div class="h-screen font-special relative">
    <c-header></c-header>
    <nuxt class="absolute h-full inset-x-0" />
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
