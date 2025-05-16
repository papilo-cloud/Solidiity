// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract MyERC1155 is ERC1155, Ownable {
  string public name;
  string public symbol;

  mapping(uint256 => string) public tokenURI;

  constructor() ERC1155("") Ownable(msg.sender) {
    name = "DeadEazy";
    symbol = "DZY";
  }

  function mint(
    address _to,
    uint256 _id,
    uint256 _amount
  ) external onlyOwner {
    _mint(_to, _id, _amount, "");
  }

  // insert batchMint function here
  function batchMint(
    address _to,
    uint256[] memory _ids,
    uint256[] memory _amount
    ) external onlyOwner {
    _mintBatch(_to, _ids, _amount, "");
  }

  function setURI(uint256 _id, string memory _uri) external onlyOwner {
    tokenURI[_id] = _uri;
    emit URI(_uri, _id);
  }

  function uri(uint256 _id) public view override returns (string memory) {
    return tokenURI[_id];
  }

}