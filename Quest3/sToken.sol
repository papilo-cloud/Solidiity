// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

// add inheritance
contract sToken is ERC20, ERC20Burnable, Ownable {
    // insert constructor function here

    constructor(string memory _name, string memory _symbol, address initialOwner)
        ERC20(_name, _symbol)
        Owmable(initialOwner) {}

    // insert mint function here
    function mint(address _to, uint _amount) external onlyOwner {
        _mint(_to, _amount);
    }

    // insert burn function here
    function burn(address _to, uint _amount) external onlyOwner {
        _burn(_to, _amount);
    }
}
