<template>
  <div>
    <headerSpacer />
    <card class="m-6 -mt-48" />

    <p class="text-center mx-5 text-sm mt-12">Upload an image of yourself to start the identification prozess. This image is onyl used for a verification. You upload your picture to a secure data container. </p>

      <div class="w-full flex items-center flex-col mt-12">
      <file-select v-model="file" class="w-2/3"></file-select>

      <p class="mt-4 text-primary font-bold text-sm">take image</p>
    </div>
  </div>
</template>

<script>
import card from '~/components/card'
import headerSpacer from '~/components/headerSpacer'
import fileSelect from '~/components/fileselect'

export default {
  data: () => ({
    file: null
  }),

  methods: {
    async upload(file) {

    // Reject big files
    if (file.size > 5000 * 1024) {
      console.log('Please select a smaller file')
      return
    }

    // Begin file upload
    console.log('Uploading file to Imgur..')

    // Replace ctrlq with your own API key
    const apiUrl = 'https://api.imgur.com/3/image'
    const apiKey = '8b063145e43e437'

    const formData = new FormData()
    formData.append('image', file)
    // Response contains stringified JSON
    // Image URL available at response.data.link
    const { data } = await this.$axios.post(apiUrl, formData, {
      headers: {
        Authorization: 'Client-ID ' + apiKey,
        Accept: 'application/json'
      }
      })

      const id = data.data.link.split('/')
      const img = id[id.length - 1].split('.')[0]
      this.$store.dispatch('chain/register', img)

      this.$store.commit('verify/SET_IMG', data.data.link)

      this.$router.push('verify/awaiting')
    }
  },

  watch: {
    file(newVal) {
      if (newVal !== null) {
        this.upload(newVal)
      }
    }
  },

  components: {
    card,
    headerSpacer,
    fileSelect
  }
}
</script>

