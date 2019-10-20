<template>
  <div class="rounded w-full text-left py-1 px-4" :class="{'background-ver': finalId, 'background-alt-ver': !finalId }">
    <div v-if="finalId" class="text-color-ver">
      <span>{{ index }}. Verification</span>
    </div>

  <template v-else>
    <div class="bg-secondary flex justify-between items-center text-primary">
      <span>{{ id.substring(0, 16) }}</span>
      <span>
        <svg width="17" height="12" viewBox="0 0 17 12" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M2 6L6.33333 10L15 2" stroke="#5351FD" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
  </span>
    </div>
    </template>
  </div>

</template>

<script>
export default {
  props: {
    index: {
      type: String,
      required: true
    },
    id: {
      type: String,
      required: true
    }
  },

  computed: {
    finalId() {
      return this.id === ''
    }
  }
}
</script>

<style>
.background-ver {
  background: rgba(196, 196, 196, 0.25)
}

.background-alt-ver {
  @apply bg-secondary
}

.text-color-ver {
  color: rgba(59, 59, 59, 0.25);
}
</style>
