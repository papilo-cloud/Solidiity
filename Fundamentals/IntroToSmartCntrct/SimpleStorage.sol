// SPDX-Licence-Identifier: GPL-3.0
pragma solidity ^0.8.20;

contract SimpleStorage {
    uint storeData;

    function set(uint x) {
        storeData = x;
    }

    function get() public view returns(uint) {
        return storeData;
    }
}