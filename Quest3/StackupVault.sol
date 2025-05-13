// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {sToken} from "./sToken.sol";

contract StackupVault {
    // mapping of token address to underlying tokens and claim tokens
    mapping(address => IERC20) public tokens;
    mapping(address => sToken) public claimTokens;

    constructor(address uniAddr, address linkAddr) {
        // initialize mapping of underlying token address => claim tokens
        claimTokens[uniAddr] = new sToken("Claim Uni", "sUNI");
        claimTokens[linkAddr] = new sToken("Claim Link", "sLink");

        // initialize mapping of underlying token address => underlying tokens
        tokens[uniAddr] = IERC20(uniAddr);
        tokens[linkAddr] = IERC20(linkAddr);
    }

    function deposit(address tokenAddr, uint256 amount) external {
        // transfer underlying tokens from user to vault, assume that user has already approved vault to transfer underlying tokens
        require(tokens[tokenAddr].transferFrom(msg.sender, address(this), amount), "transferFrom failed");
        // mint sTokens
        claimTokens[tokenAddr].mint(msg.sender, amount);
    }

    function withdraw(address tokenAddr, uint256 amount) external {
        // burn sTokens
        claimTokens[tokenAddr].burn(msg.sender, amount);
        // transfer underlying tokens from vault to user
        require(tokens[tokenAddr].transfer(msg.sender, amount), "transfer failed");
    }
}
