// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract Deposit is Initializable, OwnableUpgradeable {

  function initialize() public initializer {
    __Ownable_init();
  }

  event Deposited(address indexed payee, uint256 weiAmount);

  function deposit() external payable onlyOwner {
    emit Deposited(msg.sender, msg.value);
  }
  
  function getBalance() external view returns(uint256) {
    return address(this).balance;
  }

}