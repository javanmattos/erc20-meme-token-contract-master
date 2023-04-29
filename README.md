# Hardhat Standard Environment

This project demonstrates a standard Hardhat use case. It comes with a sample contract, a test for that contract, and a script that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```

```Get Started
npm install

```Compilation
npx hardhat compile

```Depolyment
npx hardhat run scripts/deploy.js --network <NETWORK_NAME>
npx hardhat run scripts/deployProxy.js --network <NETWORK_NAME>

```Verification
npx hardhat verify <ADDRESS> --network <NETWORK_NAME>

```Test
npx hardhat test
npx hardhat test test/script.js