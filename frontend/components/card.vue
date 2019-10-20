<template>
  <div class="p-8 flex justify-center items-center rounded-lg shadow-xl bg-white z-10 max-h relative">
    <img :src="img" :class="{'rounded-full': !defaultImg}">
    <div v-if="!defaultImg" class="absolute pos">
      <svg width="70" height="70" viewBox="0 0 70 70" fill="none" xmlns="http://www.w3.org/2000/svg">
      <g filter="url(#filter0_d)">
      <path d="M35 51C46.0457 51 55 42.0457 55 31C55 19.9543 46.0457 11 35 11C23.9543 11 15 19.9543 15 31C15 42.0457 23.9543 51 35 51Z" fill="#5351FD"/>
      </g>
      <path d="M35 51C46.0457 51 55 42.0457 55 31C55 19.9543 46.0457 11 35 11C23.9543 11 15 19.9543 15 31C15 42.0457 23.9543 51 35 51Z" fill="#5351FD"/>
      <path d="M27.9412 32.1766L33.0392 36.8825L43.2353 27.4707" stroke="white" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"/>
      <defs>
      <filter id="filter0_d" x="0" y="0" width="70" height="70" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
      <feFlood flood-opacity="0" result="BackgroundImageFix"/>
      <feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"/>
      <feOffset dy="4"/>
      <feGaussianBlur stdDeviation="7.5"/>
      <feColorMatrix type="matrix" values="0 0 0 0 0.305882 0 0 0 0 0.4 0 0 0 0 0.992157 0 0 0 0.2 0"/>
      <feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow"/>
      <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow" result="shape"/>
      </filter>
      </defs>
      </svg>
    </div>

  </div>
</template>

<script>
export default {
  props: {
    img: {
      type: String,
      default: '/default-img.svg'
    }
  },

  computed: {
    defaultImg() {
      return this.img === '/default-img.svg'
    }
  },
}
</script>

<style>
.max-h {
  max-height: 20rem;
}

.pos {
  bottom: 30px;
  right: 40px;
}
</style>
