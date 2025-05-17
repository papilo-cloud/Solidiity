// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/AccessControl.sol";

contract EduToken is ERC1155, AccessControl {
    // Define roles for teachers and students
    bytes32 public constant TEACHER_ROLE = keccak256("TEACHER_ROLE");
    bytes32 public constant STUDENT_ROLE = keccak256("STUDENT_ROLE");
    
    constructor () ERC1155("https://myapi.com/api/token/{id}.json") {
        grantRole(DEFAULT_ADMIN_ROLE, msg.sender); // The deployer can manage roles
    }

    // Custom function to award credits
    function awardCredits(address student, uint256 amount) external {
        require(
            hasRole(TEACHER_ROLE, msg.sender),
            "Only teachers can award credits"
        );
        _mint(student, 0, amount, ""); // Assuming '0' is the ID for credits
    }

    // Custom function for students to claim rewards
    function claimReward(uint256 rewardId) external {
        require(
            hasRole(STUDENT_ROLE, msg.sender),
            "Only students can claim rewards"
        );
        uint256 creditCost = getRewardCost(rewardId); // A function to determine the cost
        _burn(msg.sender, 0, creditCost);
        _mint(msg.sender, rewardId, 1, "");
    }

    // Sample function to determine reward cost (can be more dynamic)
    function getRewardCost(uint256 rewardId) internal pure returns(uint256) {
        // For simplicity, assume each reward NFT costs 10 rcedits
        return 10;
    }

    function supportsInterface(bytes4 interfaceId)
    public
    view
    virtual
    override(ERC1155, AccessControl)
    returns (bool) 
    {
        return ERC1155.supportsInterface(interfaceId) ||
            AccessControl.supportsInterface(interfaceId);
    }
}