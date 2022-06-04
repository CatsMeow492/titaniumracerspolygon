# polygontest

## Initialize
npm init
npx hardhat

## Make directories for contracts and scripts
mkdir contracts && mkdir scripts

## Install dependencies
npm install @openzeppelin/contracts
npm install dotenv --save
npm install --save-dev @nomiclabs/hardhat-ethers "ethers@^5.0.0"
npm install @maticnetwork/maticjs-web3

## Compile contracts
npx hardhat compile
