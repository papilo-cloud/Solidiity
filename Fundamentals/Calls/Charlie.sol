// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Charlie {
    function setValueInAlice(address aliceAddr, uint256 _value) public returns (bool, bytes memory) {
        (bool success, bytes memory data) = aliceAddr.call(
            abi.encodeWithSignature("setData(uint256)", _value)
        );
        require(success, "Call failed");
        return (success, data);
    }
}