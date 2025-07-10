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

    function payBill(address _venue, uint _amount) external {
        (bool sent, ) = _venue.call{value: _amount}("");
        require(sent);

        uint cost = address(this).balance / members.length;

        for(uint i = 0; i < members.length; i++) {
            (bool sent1, ) = members[i].call{value: cost}("");
            require(sent1);
        }
    }
}