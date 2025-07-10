// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Party {
    uint deposit;
    address[] members;
    mapping(address => bool) joined;
    
	constructor(uint256 _deposit) {
        deposit = _deposit;
    }

    function rsvp() external payable {
        require(msg.value == deposit);
        require(!joined[msg.sender]);
        members.push(msg.sender);
        joined[msg.sender] = true;
    }
}