<template>
  <div>
    <headerSpacer />
    <card class="m-6 -mt-48" :img="img" />

    <p class="text-center mx-5 text-sm mt-12">You Uploaded sucessfullly a picture! No worrys, it is stored in a secure data container. After Verification an AI makes sure that there isn’t any duplicate.</p>

      <div class="w-full flex items-center flex-col mt-12">

        <button-primary @click="verify">Get Verified</button-primary>

      <p class="mt-4 text-primary font-bold text-sm">more about privacy</p>
    </div>

    <awaiting-modal v-if="modal" @close="modal = false" />
  </div>
</template>

<script>
import card from '~/components/card'
import headerSpacer from '~/components/headerSpacer'
import buttonPrimary from '~/components/buttonPrimary'
import awaitingModal from '~/components/awaiting'

export default {

  mounted() {
    this.$store.commit('SET_HEADER', 'get verified')
  },

  data: () => ({
    modal: false
  }),

  computed: {
    img() {
      return this.$store.state.verify.img
    },
    awaiting() {
      return this.$store.state.chain.rebel.confCount
    }
  },

  methods: {
    verify() {
      const id = this.img.split('/')
      const img = id[id.length - 1].split('.')[0]
      this.$store.dispatch('chain/register', img)

      this.modal = true
    }
  },

  watch: {
    awaiting(newVal) {
      if (newVal === '1' || newVal === '2') {
        this.modal = true
      }
    }
  },


  components: {
    card,
    headerSpacer,
    buttonPrimary,
    awaitingModal,
  }
}
</script>

