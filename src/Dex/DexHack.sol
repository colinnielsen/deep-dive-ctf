// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;
import "./Dex.sol";

contract DexHack {
    Dex dex;
    constructor(Dex _dex) {
        dex = _dex;
    }

    function attack() external {
        // code here
    }
}
