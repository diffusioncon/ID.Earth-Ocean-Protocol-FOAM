<template>
  <div class="text-center m-4">

    <p class="text-xl my-2">Identity Verification</p>

    <p class="text-gray-400 my-2">let your buddys scan this QR Code </p>

    <p class="my-4">{{ this.$store.state.chain.address }}</p>

    <verification :id="rebel.budy1" index="1"/>

    <verification :id="rebel.budy2" index="2"/>
  </div>
</template>

<script>
import QRCode from 'qrcode'
import verification from '~/components/verification'
export default {
  components: {
    verification
  },
  computed: {
    rebel() {
      return this.$store.state.chain.rebel
    }
  },
  mounted() {
    const interval = setInterval(() => {
      this.$store.dispatch('chain/getRebel')
    }, 1000);
  },
}
</script>

<style></style>
