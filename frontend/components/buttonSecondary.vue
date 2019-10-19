<template>
  <default-button class="bg-secondary">
    <slot></slot>
  </default-button>
</template>

<script>
import defaultButton from './button'
export default {
  components: {
    defaultButton
  }
}
</script>
