// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EncodeWithSelectorExample {
    function encodeWithSelector(uint256 number, string memory text) public pure returns (bytes memory) {
        bytes4 selector = bytes4(keccak256("myFunction(uint256,string)"));
        return abi.encodeWithSelector(selector, number, text);
    }
}