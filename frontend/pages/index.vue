<template>
  <div class="flex items-center flex-col justify-between">
    <span class="text-5xl">
      Hi!
    </span>

    <div class="text-2xl">
      You want to join?
    </div>

    <button-primary>Let's go</button-primary>
  </div>
</template>

<script>
import buttonPrimary from '~/components/buttonSecondary'
export default {
  components: {
    buttonPrimary
  }
}
</script>
