// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Switch {
    address recipient;
    address owner;
    uint lastInitiated;

    constructor(address _addr) payable {
        recipient = _addr;
        owner = msg.sender;
        lastInitiated = block.timestamp;
    }

    function withdraw() external {
        require(msg.sender == recipient);
        require((block.timestamp - lastInitiated) >= 52 weeks);
        (bool sent, ) = recipient.call{value: address(this).balance}("");
        require(sent);
    }

    function ping() external {
        require(owner == msg.sender);
        lastInitiated = block.timestamp;
    }
}