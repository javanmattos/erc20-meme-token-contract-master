const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Token contract", function () {
  
  let tokenFactory;
  let token;
  let owner;
  let buyer;

  let totalSupply = 1000000000;
  let ownerBalance = 900000000;

  beforeEach(async function () {
    tokenFactory = await ethers.getContractFactory("WDUM");
    token = await tokenFactory.deploy();
    [owner, buyer] = await ethers.getSigners();
    // console.log("Owner address: ", owner);
    // console.log("Buyer address: ", buyer);
  });

  describe("Deployment", function () {
    it("Should set the right owner", async function () {
      expect(await token.balanceOf(owner.address) / 10**18).to.equal(ownerBalance);
      // console.log(buyer);
    });

    it("Should set the total supply", async function () {
      expect(await token.totalSupply() / 10**18).to.equal(totalSupply);
    });
  });

  // describe("Transactions", function () {
  //   it("Should transfer tokens between accounts", async function () {
  //     await token.transfer(buyer.address, 100);
  //     expect(await token.balanceOf(owner.address)).to.equal(900);
  //     expect(await token.balanceOf(buyer.address)).to.equal(100);
  //   });

  //   it("Should fail if sender doesn’t have enough tokens", async function () {
  //     const initialOwnerBalance = await token.balanceOf(owner.address);

  //     await expect(
  //       token.transfer(buyer.address, 10000)
  //     ).to.be.revertedWithoutReason();

  //     expect(await token.balanceOf(owner.address)).to.equal(initialOwnerBalance);
  //   });

  //   it("Should update allowance", async function () {
  //     await token.approve(buyer.address, 100);
  //     expect(await token.allowance(owner.address, buyer.address)).to.equal(100);
  //   });

  //   it("Should transfer tokens from one account to another with allowance", async function () {
  //     await token.approve(buyer.address, 100);
  //     await token.transferFrom(owner.address, buyer.address, 100);

  //     expect(await token.balanceOf(owner.address)).to.equal(900);
  //     expect(await token.balanceOf(buyer.address)).to.equal(100);
  //     expect(await token.allowance(owner.address, buyer.address)).to.equal(0);
  //   });

  //   it("Should fail if sender doesn’t have enough allowance", async function () {
  //     await token.approve(buyer.address, 99);

  //     await expect(
  //       token.transferFrom(owner.address, buyer.address, 100)
  //     ).to.be.revertedWith("ERC20: transfer amount exceeds allowance");
  //   });
  // });
});