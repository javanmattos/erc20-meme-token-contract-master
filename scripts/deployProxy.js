
  const { ethers, upgrades } = require('hardhat');

  const main = async() => {

    const contractName = "BOIL";
    
    const contractFactory = await ethers.getContractFactory(contractName);
    
    const contractObject  = await upgrades.deployProxy(contractFactory, { initializer: 'initialize' });

    await contractObject.deployed();

    console.log(`\nContract deployed to:\n${contractObject.address}`);
  }

  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });