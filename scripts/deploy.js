
const { ethers } = require('hardhat');

const main = async() => {

  const contractName = "WDUMT1";

  const contractFactory = await ethers.getContractFactory(contractName);

  const contractObject = await contractFactory.deploy();

  await contractObject.deployed();

  console.log(`\nContract deployed to:\n${contractObject.address}`);
  console.log("Contract information: ", contractName, contractFactory, contractObject);

}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });