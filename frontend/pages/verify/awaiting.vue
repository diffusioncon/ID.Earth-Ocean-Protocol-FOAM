<template>
  <div>
    <img :src="img" />

    <verification />
  </div>
</template>

<script>
import verification from '~/components/verification'
export default {
  components: {
    verification
  },
  computed: {
    img() {
      return this.$store.state.img
    }
  }
}
</script>

<style></style>
