// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;
import "./DexTwo.sol";

contract DexTwoHack {
    DexTwo dexTwo;
    constructor(DexTwo _dexTwo) {
        dexTwo = _dexTwo;
    }

    function attack() external {
        // code here
    }
}
