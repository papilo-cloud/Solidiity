// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Token {
    uint public totalSupply;
    string public name = "DEADEAZY";
    string public symbol = "DZY";
    uint8 public decimals = 18;

    mapping(address => uint256) public balances;

    function balanceOf(address _addr) external view returns(uint) {
        return balances[_addr];
    }
}