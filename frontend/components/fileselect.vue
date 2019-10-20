<template>
  <label>
    <button-primary class="w-full" @click="$refs.file.click()">Upload</button-primary>
    <input type="file" ref="file" @change="handleFileChange" class="hidden"/>
  </label>
</template>

<script>
import buttonPrimary from './buttonPrimary'
export default {
  props: {
    value: {
      required: true
    }
  },

  methods: {
    handleFileChange(e) {
      this.$emit('input', e.target.files[0])
    }
  },

  components: {
    buttonPrimary
  }
}
</script>

<style scoped>
.file-select > input[type="file"] {
  display: none;
}
</style>
