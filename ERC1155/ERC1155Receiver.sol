// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC1155Receiver {
    function onERC1155Received(address operator, address from, uint256 id, uint256 value, bytes calldata data) external returns(bytes4);
    function onERC1155BatchReceived(address operator, address from, uint256[] calldata ids, uint256[] calldata values, bytes calldata data) external returns(bytes4);
}

contract CanReceiveERC1155 is IERC1155Receiver {
    function onERC1155Received(address, address, uint256, uint256, bytes calldata) external pure override returns(bytes4) {
        // insert logic for actions to perform after receiving ERC1155 tokens 
        return this.onERC1155Received.selector;
    }
    
    function onERC1155BatchReceived(address, address, uint256[] calldata, uint256[] calldata, bytes calldata) external pure override returns(bytes4) {
        // insert logic for actions to perform after receiving ERC1155 tokens 
        return this.onERC1155BatchReceived.selector;
    }
}