// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EncodeWithSignatureExample {
    function encodeWithSignature(uint256 number, string memory text) public pure returns (bytes memory) {
        return  abi.encodeWithSignature("myFunction(uint256,string)", number, text);
    }
}