import Vue from 'vue'
import abi from '~/plugins/abi.json'
import Web3 from 'web3'

export const state = () => ({
  address: '',
  iRebellion: {},
  rebellion: {},
  rebel: {
    img: '',
    confCount: '0',
    buy1: '',
    buy2: ''
  }
})

export const mutations = {
  SET_ADDRESS(state, address) {
    state.address = address
  },

  SET_I(state, i) {
    Vue.set(state, 'iRebellion', i)
  },

  SET_CONTRACT(state, c) {
    Vue.set(state, 'rebellion', c)
  },

  SET_REBEL(state, data) {
    state.rebel.img = data.img
    state.rebel.confCount = data.confCount
    state.rebel.buy1 = data.buy1
    state.rebel.buy2 = data.buy2
  }
}

let iRebellion = {}
let address = ''

export const actions = {
  async init({commit}) {
    const injectedProvider = window.ethereum
    const addresses = await injectedProvider.enable()
    const iWeb3 = new Web3(injectedProvider)
    address = addresses[0]

    iRebellion = new iWeb3.eth.Contract(
      abi,
      '0x0b6fce6075a9d4ad34e5565fedf7c495a2d82c1a'
    )
  },

  async getRebel({ commit, state }) {
    console.log(address)
    const rebel = await this.$rebellion.methods.rebels(address).call()

    commit('SET_REBEL', rebel)
  }
}
