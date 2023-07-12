
const { ethers } = require('hardhat');

const main = async() => {

  const contractName = "WDUM";

  const contractFactory = await ethers.getContractFactory(contractName);

  const contractObject = await contractFactory.deploy();

  await contractObject.deployed();

}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });