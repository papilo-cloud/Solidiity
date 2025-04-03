// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SolidityFundamentals2 {
    
    enum State {IN_PROGRESS, ENDED }
    address payable public owner;
    State public currentState;

    constructor() {
        owner = payable(msg.sender); 
    }

    modifier stillInProgress() {
        require(currentState == State.IN_PROGRESS, "donation phase is no longer in progress");
        _;
    }

    function donate()external payable stillInProgress {}

    function checkAmountCollected() public view returns (uint256){
        return address(this).balance;
    }

    function withdraw() external {
        uint amount = address(this).balance;
        require(msg.sender == owner, "only the owner can withdraw");
        owner.transfer(amount);
        currentState = State.ENDED;
    }
}