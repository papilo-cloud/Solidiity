// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract SolidityFundamentals1 {
    address public owner;
    uint256 public x = 5;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not Owner");
        _;
    }

    function add(uint256 y) public view onlyOwner returns(uint256) {
        require(y > x, "y should be greater than x");
        uint256 z = x + y;
        return z;
    }
}