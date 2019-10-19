<template>
  <div>
    <span>You are about to verify: {{ id }}</span>

    <img :src="img" />

    <button @click="accept">yes</button>
  </div>
</template>

<script>
export default {
  props: {
    id: {
      type: Number || String,
      required: true
    }
  },

  computed: {
    img() {
      return this.$store.state.verify.img
    }
  },

  created() {
    this.$store.state.dispatch('verify/init', this.id)
  },

  methods: {
    accept() {}
  }
}
</script>

<style></style>
