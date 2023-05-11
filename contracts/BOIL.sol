// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract BOIL is Ownable, IERC20 {
  
    // Token name
    string private _name;

    // Token symbol
    string private _symbol;

    // Token decimals
    uint8 private _decimals;

    // Token Total Supply
    uint256 private _totalSupply;

    // Mapping from address to amount of Token
    mapping(address => uint256) private _balances;

    // Mapping from owner to operator's allowances
    mapping(address => mapping(address => uint256)) private _allowances;

    /**
    * @dev Sets the initialization values.
    */
    constructor(
      string memory name_,
      string memory symbol_,
      uint8 decimals_,
      uint256 totalSupply_
    ) {
      
      _name = "BOIL";
      _symbol = symbol_;
      _decimals = decimals_;
      _totalSupply = totalSupply_;

    }

    /**
    * @dev Returns the name of the token.
    */
    function name() external view returns(string memory) {
      return _name;
    }

    /**
    * @dev Returns the symbol of the token.
    */
    function symbol() external view returns(string memory) {
      return _symbol;
    }

    /**
    * @dev Returns the decimals of the token.
    */
    function decimals() external view returns(uint256) {
      return _decimals;
    }

    /**
    * @dev Returns the total supply of the token.
    */
    function totalSupply() external view override returns(uint256) {
      return _totalSupply;
    }

    /**
    * @dev Returns the amount of tokens owned by `account`.
    */
    function balanceOf(address account) external view override returns(uint256) {
      return _balances[account];
    }

    /**
    * @dev Returns the allowances.
    */
    function allowance(address owner, address spender) external view override returns(uint256) {
      return _allowances[owner][spender];
    }

    /**
    * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
    */
    function approve(address spender, uint256 amount) public override returns(bool) {
      address owner = _msgSender();
      _approve(owner, spender, amount);
      return true;
    }

    /**
    * @dev Moves `amount` tokens from the caller's account to `to`.
    */
    function transfer(address to, uint256 amount) public override returns(bool) {
      address owner = _msgSender();
      _transfer(owner, to, amount);
      return true;
    }

    /**
    * @dev Moves `amount` tokens from `from` to `to` using the
    * allowance mechanism. `amount` is then deducted from the caller's
    * allowance.
    */
    function transferFrom(
      address from,
      address to,
      uint256 amount
    ) external view override returns(bool) {

    }

    /*////////////////////////////////////////////////
                    INTERNAL FUNCTIONS
      ////////////////////////////////////////////////*/

    function _spendAllownace(
      address owner,
      address spender,
      uint256 amount
    ) private {
        uint256 currentAllowance = _allowances[owner][spender];
        if(currentAllowance != type(uint256).max) {
          require(currentAllowance >= amount, "Insufficient allowance");
        unchecked {
          _approve(owner, spender, currentAllowance - amount);
        }
      }
    }
    
    function _approve(
      address owner,
      address spender,
      uint256 amount
    ) private {
        require(owner != address(0), "Approval from the zero address");
        require(spender != address(0), "Approval to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    function _transfer(
      address from,
      address to,
      uint256 amount
    ) private {

    }
}