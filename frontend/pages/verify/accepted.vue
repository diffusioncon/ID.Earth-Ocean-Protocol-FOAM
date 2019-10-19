<template>
  <div>
    <span>Thanks for Accepting {{ id }}!</span>
  </div>
</template>

<script>
export default {
  computed: {
    id() {
      return this.$store.state.verify.id
    }
  }
}
</script>

<style></style>
