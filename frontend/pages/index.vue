<template>
  <div class="flex items-center flex-col justify-between">
    <span class="text-5xl">
      Hi!
    </span>

    <div class="text-2xl">
      You want to join?
    </div>

    <nuxt-link to="verify/index">Let's go</nuxt-link>
  </div>
</template>

<script>
import buttonPrimary from '~/components/buttonSecondary'
export default {
  components: {
    buttonPrimary
  },

  methods: {
    register() {
      this.$store.dispatch('chain/register')
    }
  }
}
</script>
