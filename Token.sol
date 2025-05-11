// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20{
    address public owner;

    constructor() ERC20("Sour Eva", "Eva"){
        owner = msg.sender;
    }

    function mint(address _to, uint _amount) external {
        require(owner == msg.sender, "Not the Owner");
        _mint(_to, _amount);
    }
}