export const state = () => ({
  id: '',
  img: '/me.jpg'
})

export const mutations = {
  SET_ID({ state, dispatch }, id) {
    state.id = id
  },

  SET_IMG({ state }, img) {
    state.img = img
  }
}

export const actions = {
  init({ commit, dispatch }, id) {
    commit('SET_ID', id)

    dispatch('fetch_image')
  },

  fetch_image({ commit }) {
    const img = ''

    commit('SET_IMG', img)
  }
}
