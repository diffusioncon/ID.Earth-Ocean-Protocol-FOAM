const Rebellion = artifacts.require('Rebellion');
const IOceanDIDRegistry = artifacts.require('IOceanDIDRegistry');

contract('Rebellion', (accounts) => {

  function toHex(str){
    let hex;
    try{
      hex = unescape(encodeURIComponent(str))
      .split('').map((v) => v.charCodeAt(0).toString(16)).join('')
    }
    catch(e){
      hex = str
      console.log(`invalid text input: ${  str}`)
    }
    return `0x${hex}`;
  }

  const rebel = accounts[0];
  const budy1 = accounts[1];
  const pic1 = 'http://catpic.com/1234';
  const budy2 = accounts[2];
  const pic2 = 'http://catpic.com/4466';
  let rebellion;

  before(async () => {
    const reg = await IOceanDIDRegistry.new();    
    rebellion = await Rebellion.new(budy1, toHex(pic1), budy2, toHex(pic2), reg.address, accounts[9]);
  });

  it('is joinable', async () => {
    const pic3 = 'http://catpic.com/1234';
    await rebellion.signup(toHex(pic3), toHex(pic3), toHex(pic3));
    let rebelData = await rebellion.rebels(rebel);
    assert.equal(rebelData.confCount, 1);
    await rebellion.confirm(rebel, {from: budy1});
    rebelData = await rebellion.rebels(rebel);
    assert.equal(rebelData.confCount, 2);
    await rebellion.confirm(rebel, {from: budy2});
    rebelData = await rebellion.rebels(rebel);
    assert.equal(rebelData.confCount, 3);
    assert.equal(rebelData.budy1, budy1);
    assert.equal(rebelData.budy2, budy2);
  });

});