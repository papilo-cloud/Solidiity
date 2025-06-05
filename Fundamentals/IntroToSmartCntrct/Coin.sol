// SPDX-Licence-Identifier: GPL-3.0
pragma solidity ^0.8.20;

contract Coin {
    
    address public minter;
    mapping(address => uint) public balances;

    event Sent(address from, address to, uint amount);

    constructor () {
        minter = msg.sender;
    }

    function mint(address to, uint amount) public {
        require(msg.sender == minter, "not the owner");
        balances[to] += amount;
    }

    error InsufficientBalance(uint requested, uint available);

    function transfer(address recipient, address caller, uint amount) public {
        require(balance[msg.sender] >= amount, InsufficientBalance(amount, balances[msg.sender]))
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
        emit Sent(msg.sender, recipient, amount)
    }

    
}