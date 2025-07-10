// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Hackathon {
    struct Project {
        string title;
        uint[] ratings;
    }

    Project[] projects;

    // TODO: add the findWinner function

    function newProject(string calldata _title) external {
        // creates a new project with a title and an empty ratings array
        projects.push(Project(_title, new uint[](0)));
    }

    function rate(uint _idx, uint _rating) external {
        // rates a project by its index
        projects[_idx].ratings.push(_rating);
    }

    function average(uint256[] memory _rating) internal pure returns(uint) {
        uint total;
        for(uint i = 0; i < _rating.length; i++) {
            total += _rating[i];
        }
        return _rating.length == 0 ? 0 : total / _rating.length;
    }

    function findWinner() external view returns(Project memory) {
        uint higestRating = 0;

        for(uint i = 1; i < projects.length; i++) {
            if(average(projects[i].ratings) > average(projects[higestRating].ratings)){
                higestRating = i;
            }
        }
        return projects[higestRating];
    }
}