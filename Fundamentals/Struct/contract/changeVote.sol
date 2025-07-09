// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}
	
	Vote none = Vote(Choices(0), address(0));
	// TODO: create a public state variable: an array of votes
	Vote[] public votes;

	function createVote(Choices choice) external {
		// TODO: add a new vote to the array of votes state variable
		require(!hasVoted(msg.sender));
		votes.push(Vote(choice, msg.sender));
	}

	function findVote(address _addr) internal view returns(Vote storage) {
		for(uint i = 0; i < votes.length; i++) {
			if(votes[i].voter == _addr){
				return votes[i];
			}
		}
		return none;
	}

	function hasVoted(address _addr) public view returns(bool){
		return findVote(_addr).voter == _addr;
	}

	function findChoice(address _addr) external view returns(Choices){
		return findVote(_addr).choice;
	}

	function changeVote(Choices choice) external {
		require(hasVoted(msg.sender));
		Vote storage vote = findVote(msg.sender);
		vote.choice = choice;
	}
}