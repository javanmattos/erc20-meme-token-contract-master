// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Withdraw is Ownable {
  
  constructor() {}

  event Withdrawn(address indexed payee, uint256 weiAmount);

  function withdraw() external {
    uint256 balance = address(this).balance;
    (bool success, ) = msg.sender.call{value: balance}("");
    require(success, "Transfer Failed");
    emit Withdrawn(msg.sender, balance); 
  }

  function getBalance() external view returns(uint256) {
    return address(this).balance;
  }

}