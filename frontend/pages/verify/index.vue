<template>
  <div>
    <input type="file" @input="upload" />

    <nuxt-link to="verify/awaiting">-> let yourself verify</nuxt-link>
  </div>
</template>

<script>
export default {
  methods: {
    upload(e) {
      console.log(e)
    }
  }
}
</script>
