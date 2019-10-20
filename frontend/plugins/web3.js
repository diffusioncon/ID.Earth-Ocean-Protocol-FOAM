import Web3 from 'web3'
import vuex from 'vuex'
import abi from './abi.json'

export default (ctx, inject) => {
  const web3 = new Web3('wss://rinkeby.infura.io/ws/v3/f039330d8fb747e48a7ce98f51400d65')

  const rebellion = new web3.eth.Contract(
    abi,
    '0x0b6fce6075a9d4ad34e5565fedf7c495a2d82c1a'
  )

  ctx.$rebellion = rebellion
  inject('rebellion', rebellion)
}
