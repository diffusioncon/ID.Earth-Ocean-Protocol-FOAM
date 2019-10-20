import Web3 from 'web3'
import vuex from 'vuex'
import abi from './abi.json'

export default (ctx, inject) => {
  const web3 = new Web3('wss://rinkeby.infura.io/ws/v3/f039330d8fb747e48a7ce98f51400d65')

  const rebellion = new web3.eth.Contract(
    abi,
    '0x6eb9d3f2811884e3583f2a707b9635bf8e16dec5'
  )

  ctx.$rebellion = rebellion
  inject('rebellion', rebellion)
}
