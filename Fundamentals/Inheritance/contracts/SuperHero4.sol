// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./Hero4.sol";

// TODO: create Mage/Warrior Heroes

contract Mage is Hero(50) {

    function attack(address _addr) override public {
        Enemy enemy = Enemy(_addr);
        enemy.takeAttack(AttackTypes.Spell);
        super.attack(_addr);
    }
}

contract Warrior is Hero(200) {

    function attack(address _addr) override public {
        Enemy enemy = Enemy(_addr);
        enemy.takeAttack(AttackTypes.Brawl);
        super.attack(_addr);
    }
}