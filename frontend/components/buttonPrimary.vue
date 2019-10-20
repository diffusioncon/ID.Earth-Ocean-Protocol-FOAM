<template>
  <default-button @click="$emit('click', $event)" class="bg-primary"><slot></slot></default-button>
</template>

<script>
import defaultButton from './button'
export default {
  components: {
    defaultButton
  }
}
</script>
