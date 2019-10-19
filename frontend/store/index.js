export const state = () => ({
  id: '',
  image: ''
})

export const mutations = {}

export const actions = {
  async upload_image({ state }, files) {
    if (!files.length) {
      return
    }

    // Reject big files
    if (files[0].size > 5000 * 1024) {
      console.log('Please select a smaller file')
      return
    }

    // Begin file upload
    console.log('Uploading file to Imgur..')

    // Replace ctrlq with your own API key
    const apiUrl = 'https://api.imgur.com/3/image'
    const apiKey = '8b063145e43e437'

    const formData = new FormData()
    formData.append('image', files[0])
    // Response contains stringified JSON
    // Image URL available at response.data.link
    const data = await this.$axios.$post(apiUrl, formData, {
      headers: {
        Authorization: 'Client-ID' + apiKey,
        Accept: 'application/json'
      }
    })

    console.log(data)
  }
}
