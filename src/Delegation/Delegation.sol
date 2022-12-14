// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract Delegate {
  address public owner;

  constructor(address _owner) public {
    owner = _owner;
  }

  fallback() external {
    (uint256 slot) = abi.decode(msg.data, (uint256));
    assembly {
      sstore(slot, caller())
    }
  }
}

contract Delegation {
  event Log(uint256 slotIndex, bytes32 val);

  Delegate delegate;
  address public owner;

  constructor(address _delegateAddress) public {
    delegate = Delegate(_delegateAddress);
    owner = msg.sender;
  }

  function readSlot(uint256 slotIndex) public {
    bytes32 val;
    assembly {
      val := sload(slotIndex)
    }
    emit Log(slotIndex, val);
  }

  fallback() external {
    (bool result,) = address(delegate).delegatecall(msg.data);
    if (result) {
      this;
    }
  }
}