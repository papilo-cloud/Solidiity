// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

contract APIContract is ChainlinkClient {
    using Chainlink for Chainlink.Request;

    uint256 public  volume;

    //the ID of a specific job for the oracle node to run
    // Since we’ll be using the GET > uint256 job
    bytes32 private jobId = "ca98366cc7314957b8c012c72f05aeeb";

    // 0,1 * 10**18 (Varies by network and job)
    uint256 private fee = (1 * LINK_DIVISIBILITY) / 10;

    constructor() {
        // Since we’ll be using the Sepolia testnet for this example, 
        // we input the Sepolia address of the Chainlink Token
        _setChainlinkToken(0x779877A7B0D9E8603169DdbD7836e478b4624789);

        // since we’re using the Sepolia Testnet, we’ll need to input the 
        // Sepolia Oracle contract address
        _setChainlinkOracle(0x6090149792dAAeE9D1D568c9f9a6F6B46AA29eFD);
    }

    function requestVolumeData() public returns(bytes32 requestId) {
        Chainlink.Request memory req = _buildChainlinkRequest(jobId, address(this), this.fulfill.selector);

        // Task 1 - httpget
        // Set the URL to perform the GET request on
        req._add("get", "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=ETH&tsyms=USD");

        // Task 2 - jsonparse
        req._add("path", "RAW,ETH,USD,VOLUME24HOUR");

        // Task 3 - multiply
        // Multiply the result by 1000000000000000000 to remove decimals
        int256 timesAmount = 10 ** 18;         
        req._addInt("times", timesAmount);

        return _sendChainlinkRequest(req, fee);
    }

    function fulfill(bytes32 _requestId, uint256 _volume) public recordChainlinkFulfillment(_requestId) {
        volume = _volume;
    }
}