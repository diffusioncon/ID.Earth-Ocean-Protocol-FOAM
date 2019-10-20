<template>
  <div class="flex items-center flex-col justify-between">
    <span class="text-5xl">
      Hi!
    </span>

    <div class="text-2xl">
      You want to join?
    </div>

    <button @click="call">Let's go</button>
    <button @click="register">Let's go</button>
  </div>
</template>

<script>
import buttonPrimary from '~/components/buttonSecondary'
export default {
  components: {
    buttonPrimary
  },
  mounted() {
    this.$store.dispatch('chain/init')
  },
  methods: {
    call() {
      this.$store.dispatch('chain/getRebel')
    },
    register() {
      this.$store.dispatch('chain/register')
    }
  }
}
</script>
