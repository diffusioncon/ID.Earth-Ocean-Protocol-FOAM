<template>
  <div class="bg-gray-500 rounded w-full">
    <div v-if="!id">
      <span>{{ index }}. Verification</span>
    </div>

    <div else class="bg-secondary flex justify-between">
      <span>{{id}}</span>
      <span>
        <svg width="17" height="12" viewBox="0 0 17 12" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M2 6L6.33333 10L15 2" stroke="#5351FD" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
  </span>
    </div>
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
  }
}
</script>

<style></style>
