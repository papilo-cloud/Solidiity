// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MultiSig {
    address[] public owners;
    uint256 public required;
    uint public transactionCount;

    struct Transaction {
        address destination;
        uint256 value;
        bool executed;
    }

    mapping(uint => Transaction) public transactions;
    mapping(uint => mapping(address => bool)) public confirmations;

    constructor(address[] memory _owners, uint256 _required) {
        require(_owners.length > 0);
        require(_required > 0);
        require(_required <= _owners.length);

        owners = _owners;
        required = _required;
    }

    function addTransaction(address _destination, uint256 _value) internal returns(uint) {
        uint txId = transactionCount;
        transactions[transactionCount] = Transaction(
            _destination, _value, false
        );
        transactionCount += 1;
        return txId;
    }

    function isOwner(address _addr) private view returns(bool) {
        for(uint i = 0; i < owners.length; i++) {
            if(owners[i] == _addr) {
                return true;
            }
        }
        return false;
    }

    function confirmTransaction(uint _txId) public {
        require(isOwner(msg.sender), "Not an owner");
        confirmations[_txId][msg.sender] = true;
    }

    function getConfirmationsCount(uint _txId) public view returns(uint256) {
        uint count;
        for(uint i = 0; i < owners.length; i++) {
            if(confirmations[_txId][owners[i]] == true) {
                count++;
            }
        }
        return count;
    }

    function submitTransaction(address _destination, uint _value) external {
        uint txId = addTransaction(_destination, _value);
        confirmTransaction(txId);
    }
}
