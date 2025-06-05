// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@chainlink/contracts/src/v0.8/VRFV2WrapperConsumerBase.sol";

contract RandomNumberConsumer is VRFV2WrapperConsumerBase {
    
    address linkAddress = 0x779877A7B0D9E8603169DdbD7836e478b4624789;
    address wrapperAddress = 0xab18414CD93297B0d12ac29E63Ca20f515b3DB46;

    uint32 callbackGasLimit = 100000;
    uint16 requestConfirmations = 3;
    uint32 numWords = 2;

    struct requestStatus {
        uint256 paid;
        bool fulfilled;
        uint256[] randomWords;
    }

    mapping(uint256 => requestStatus) public requestStatuses;

    uint256[] public  requestIds;
    uint256 public  lastrequestId;

    constructor() VRFV2WrapperConsumerBase(linkAddress, wrapperAddress) {
    }

    function requestRandomWords() external returns(uint256 requestId) {
        requestId = requestRandomness(callbackGasLimit, requestConfirmations, numWords);
        requestStatuses[requestId] = requestStatus(VRF_V2_WRAPPER.calculateRequestPrice(callbackGasLimit), false, new uint256[](0));
        requestIds.push(requestId);
        lastrequestId = requestId;
        return requestId;
    }

    function fulfillRandomWords(uint256 _requestId, uint256[] memory _randomWords) internal override {
        require(requestStatuses[_requestId].paid > 0, "request not found");
        requestStatuses[_requestId].fulfilled = true;
        requestStatuses[_requestId].randomWords = _randomWords;
    }

    function getrequestStatus(uint256 _requestId) external view returns(uint256 paid, bool fulfilled, uint256[] memory randomWords) {
        require(requestStatuses[_requestId].paid > 0, "request not found");
        requestStatus memory request = requestStatuses[_requestId];
        return (request.paid, request.fulfilled, request.randomWords);
    }
}