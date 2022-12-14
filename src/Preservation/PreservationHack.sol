// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

interface IPreservation {
    function setFirstTime(uint256) external;
}

contract PreservationHack {
    IPreservation public challenge;

    constructor(address challengeAddress) {
        challenge = IPreservation(challengeAddress);
    }

    function attack() external {}
}
