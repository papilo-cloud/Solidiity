// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./IERC20.sol";

contract Chest {
    
    function plunder(address[] calldata _addr) external {
        for(uint i = 0; i < _addr.length; i++) {
            IERC20 token = IERC20(_addr[i]);
            uint balance = token.balanceOf(_addr[i]);
            token.transfer(msg.sender, balance);
        }
    }
}
