// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
pragma experimental ABIEncoderV2;

// Structs in Calldata & Memory
// Traditionally structs were not handled by the ABI. More recently, 
// the ABIEncoderV2 has been added which will allow us to pass structs
//  as calldata and return them in external functions! 

// To use the ABIEncoderV2 we need to use a new pragma statement:

contract Contract {
	enum Choices { Yes, No }

	struct Vote {
		Choices choice;
		address voter;
	}
	
	// TODO: make a new createVote function

	function createVote(Choices choice) external view returns(Vote memory){
		return Vote(choice, msg.sender);
	}
}