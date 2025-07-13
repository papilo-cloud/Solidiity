// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./Hero3.sol";

// TODO: create Mage/Warrior Heroes

contract Mage is Hero {
    constructor() Hero(50) {}

    function attack(address _addr) override public {
        Enemy enemy = Enemy(_addr);
        enemy.takeAttack(AttackTypes.Spell);
    }
}

contract Warrior is Hero {
    constructor() Hero(200) {}

    function attack(address _addr) override public {
        Enemy enemy = Enemy(_addr);
        enemy.takeAttack(AttackTypes.Brawl);
    }
}