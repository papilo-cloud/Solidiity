// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DataReceiver {
    
    function encodeData(uint256 number, string memory text) public pure returns (bytes memory){
        return abi.encode(number, text);
    }

    function receiveData(bytes memory encodedData)public pure returns (uint256 number, string memory text) {
        (number, text) = abi.decode(encodedData, (uint256, string));
        return (number, text);
    }
}