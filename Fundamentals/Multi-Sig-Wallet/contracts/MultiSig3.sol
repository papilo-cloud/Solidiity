// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MultiSig {

    struct Transaction{
        address destination;
        uint256 value;
        bool executed;
    }

    Transaction[] public transactions;
    address[] public owners;
    uint256 public required;

    constructor(address[] memory _owners, uint256 _required) {
        require(_owners.length > 0);
        require(_required > 0);
        require(_required <= _owners.length);

        owners = _owners;
        required = _required;
    }

    function transactionCount() public view returns(uint256) {
        return transactions.length;
    }
    mapping (address => uint) public identity;
}