
/**
* @type import('hardhat/config').HardhatUserConfig
*/
require('dotenv').config();
require("@nomiclabs/hardhat-ethers");
const { API_URL, PRIVATE_KEY } = process.env;
module.exports = {
   solidity: {
     compilers: [
      {
        version: "0.8.1",
      },
      {
        version: "0.8.0",
     }
     ]
   },
   defaultNetwork: "matic",
   networks: {
      hardhat: {},
      matic: {
        url: API_URL,
        accounts: [`0x${PRIVATE_KEY}`]
      }
   },
}