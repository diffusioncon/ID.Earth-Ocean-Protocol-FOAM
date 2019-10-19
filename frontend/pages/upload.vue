<template>
  <div>
    <input type="file" />

    <nuxt-link to="verify">-> let yourself verify</nuxt-link>
  </div>
</template>

<script>
export default {
  data: () => ({
    firstName: '',
    lastName: ''
  })
}
</script>
