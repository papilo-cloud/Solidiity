// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./Hero2.sol";

// TODO: create Mage/Warrior Heroes

contract Mage is Hero {
    constructor() Hero(50) {}
}

contract Warrior is Hero {
    constructor() Hero(200) {}
}