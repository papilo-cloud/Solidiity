// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Token {
    string public name = "DEADEAZY";
    string public symbol = "DZY";
    uint8 public decimals = 18;
    uint public totalSupply = 1000 * (10 ** decimals);
    address owner;

    mapping(address => uint256) public balances;

    constructor() {
        owner = msg.sender;
        balances[owner] = totalSupply;
    }

    function balanceOf(address _addr) external view returns(uint) {
        return balances[_addr];
    }
}