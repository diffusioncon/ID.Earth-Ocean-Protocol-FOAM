<template>
  <div class="absolute z-50 inset-0 h-screen flex justify-center items-center bg-awaiting">

<div class="mx-6 bg-white rounded-lg">
    <p class="text-right mr-4 mt-4" @click="$emit('close')">X</p>
    <div class="mx-5 flex items-center flex-col mb-8">
    <p class="text-lg my-2 font-bold">Identity Verification</p>

    <p class="text-gray-400 my-2 text-sm">let your buddys scan this QR code</p>

    <qr></qr>

    <!-- <span class="my-4 wrap-shit w-4 text-xs">{{ this.$store.state.chain.address }}</span> -->

    <verification :id="rebel.budy1" class="mt-4" index="1"/>

    <verification :id="rebel.budy2" index="2" class="mt-4"/>
    </div>
    </div>
  </div>
</template>

<script>
import qr from './qr.vue'
import QRCode from 'qrcode'
import verification from '~/components/verification'
export default {
  components: {
    verification,
    qr
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

<style>
.wrap-shit {
   overflow-wrap: break-word;
}

.bg-awaiting {
  background: rgba(0, 0, 0, 0.6);
}
</style>
