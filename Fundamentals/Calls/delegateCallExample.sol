// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Target { // Logic contract
    uint256 public num;
    address public sender;
    uint256 public value;

    function setVars(uint256 _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract Caller { // Storage
    uint256 public num;
    address public sender;
    uint256 public value;

    function delegateCallToTargetContract(address _conrtact, uint256 _num) public payable  {
        // Caller contract's storage is set, Target contract is not modified.
        (bool success, bytes memory data) = _conrtact.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
}