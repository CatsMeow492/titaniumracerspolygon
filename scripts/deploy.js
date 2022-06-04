
async function main() {
    const TRC = await ethers.getContractFactory("TRC")
  
    // Start deployment, returning a promise that resolves to a contract object
    const trc = await TRC.deploy()
    console.log("Contract deployed to address:", trc.address)
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error)
      process.exit(1)
    })