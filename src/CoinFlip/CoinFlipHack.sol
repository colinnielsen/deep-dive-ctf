// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

interface ICoinFlipChallenge {
    function flip(bool _guess) external returns (bool);
}

contract CoinFlipHack {
    ICoinFlipChallenge public challenge;

    constructor(address challengeAddress) {
        challenge = ICoinFlipChallenge(challengeAddress);
    }

    function attack() external payable {
        // code here
    }

    fallback() external payable {}
}