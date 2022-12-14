// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

abstract contract IReentrance {
    mapping(address => uint256) public balances;

    function donate(address _to) external payable virtual;

    function withdraw(uint256 _amount) external virtual;
}

contract ReentranceHack {
    IReentrance public challenge;
 
    constructor(address challengeAddress) {
        challenge = IReentrance(challengeAddress);
    }

    function attack() external payable {
        // ...
    }

}