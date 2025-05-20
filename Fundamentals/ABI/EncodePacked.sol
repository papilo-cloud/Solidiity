// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EncodePackedExample {
    function encodePackedData(uint256 number, string memory text) public pure returns (bytes memory) {
        return abi.encodePacked(number, text);
    }
}