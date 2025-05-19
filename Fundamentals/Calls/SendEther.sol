// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SendEther {
    function sendEther(address payable _to) public payable {
        (bool success, bytes memory data) = _to.call{value: msg.value}("");
        require(success, "Failed to send Ether");
    }
}