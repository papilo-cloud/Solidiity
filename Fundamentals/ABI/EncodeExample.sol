// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EncodeExample {
    function encodeData(uint256 number, string memory text) public pure returns (bytes memory) {
        return abi.encode(number, text);
    }
}