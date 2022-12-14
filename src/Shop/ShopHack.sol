// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;
import "./Shop.sol";

contract ShopHack {
    Shop shop;

    constructor(Shop _shop) {
        shop = _shop;
    }

    function attack() external {}
}
