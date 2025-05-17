// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CannotReceiveERC1155 {
    // This contract doesn't implement onERC1155Received or onERC1155BatchReceived
    // So, it cannot receive ERC-1155 tokens through safeTransferFrom or safeBatchTransferFrom
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}