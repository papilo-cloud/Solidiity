// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Ownable {
    address owner;

    constructor () {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}