// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./Alice.sol";

contract Bob {

    Alice public alice;

    constructor(address aliceAddr) {
        alice = Alice(aliceAddr);
    }

    function callSetData(uint256 _data) public {
        alice.setData(_data);
    }

    function getData() public view returns (uint256){
        return alice.data();
    }
}