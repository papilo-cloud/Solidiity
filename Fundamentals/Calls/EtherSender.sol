// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EtherSender {
    constructor() payable {} // Contract constructor that accepts Ether

    function transferEther(address payable recipient) public payable {
        require(msg.value > 0, "No Ether sent");
        recipient.transfer(msg.value);
    }

    function sendEther(address payable recipient) public payable  {
        require(msg.value > 0, "No Ether sent");
        bool success = recipient.send(msg.value);
        require(success, "Send Failed");
    }
}