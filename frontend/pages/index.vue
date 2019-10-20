<template>
  <div class="flex items-center flex-col justify-between">
    <span class="text-5xl">
      Hi!
    </span>

    <div class="text-2xl">
      You want to join?
    </div>

    <button @click="call">Let's go</button>
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
    async call() {
      this.$store.dispatch('chain/getRebel')
    }
  },
}
</script>
