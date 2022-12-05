pragma solidity ^0.8.9;

import "@openzeppelin/contracts/utils/math/Math.sol";
import "hardhat/console.sol";
import "./strings.sol";
import "./utils.sol";

contract Day02_1 {
    using strings for *;
    using Math for uint256;

    enum GAME_RESULT {
        WIN,
        LOSS,
        DRAW
    }
    enum MOVE {
        ROCK,
        PAPER,
        SCISSORS
    }

    mapping(string => MOVE) public str2move;
    mapping(MOVE => uint256) public pointsPerMove;
    mapping(GAME_RESULT => uint256) public pointsPerGameResult;
    mapping(bytes32 => GAME_RESULT) public gameCombinaisons;

    constructor() {
        pointsPerMove[MOVE.ROCK] = 1;
        pointsPerMove[MOVE.PAPER] = 2;
        pointsPerMove[MOVE.SCISSORS] = 3;
        pointsPerGameResult[GAME_RESULT.WIN] = 6;
        pointsPerGameResult[GAME_RESULT.LOSS] = 0;
        pointsPerGameResult[GAME_RESULT.DRAW] = 3;
        str2move["A"] = MOVE.ROCK;
        str2move["B"] = MOVE.PAPER;
        str2move["C"] = MOVE.SCISSORS;
        str2move["X"] = MOVE.ROCK;
        str2move["Y"] = MOVE.PAPER;
        str2move["Z"] = MOVE.SCISSORS;
        gameCombinaisons[keccak256(abi.encodePacked(MOVE.ROCK, MOVE.ROCK))] = GAME_RESULT.DRAW;
        gameCombinaisons[keccak256(abi.encodePacked(MOVE.ROCK, MOVE.PAPER))] = GAME_RESULT.WIN;
        gameCombinaisons[keccak256(abi.encodePacked(MOVE.ROCK, MOVE.SCISSORS))] = GAME_RESULT.LOSS;
        gameCombinaisons[keccak256(abi.encodePacked(MOVE.PAPER, MOVE.PAPER))] = GAME_RESULT.DRAW;
        gameCombinaisons[keccak256(abi.encodePacked(MOVE.PAPER, MOVE.ROCK))] = GAME_RESULT.LOSS;
        gameCombinaisons[keccak256(abi.encodePacked(MOVE.PAPER, MOVE.SCISSORS))] = GAME_RESULT.WIN;
        gameCombinaisons[keccak256(abi.encodePacked(MOVE.SCISSORS, MOVE.SCISSORS))] = GAME_RESULT.DRAW;
        gameCombinaisons[keccak256(abi.encodePacked(MOVE.SCISSORS, MOVE.PAPER))] = GAME_RESULT.LOSS;
        gameCombinaisons[keccak256(abi.encodePacked(MOVE.SCISSORS, MOVE.ROCK))] = GAME_RESULT.WIN;
    }

    function run(string memory s) external view returns (uint256) {
        strings.slice memory input = s.toSlice();

        strings.slice memory delimBreak = "\n".toSlice();
        strings.slice memory delimSpace = " ".toSlice();

        uint256 totalPoints = 0;
        while (!input.empty()) {
            strings.slice memory round = input.split(delimBreak);
            MOVE opponentMove = str2move[round.split(delimSpace).toString()];
            MOVE myMove = str2move[round.split(delimSpace).toString()];
            GAME_RESULT result = gameCombinaisons[keccak256(abi.encodePacked(opponentMove, myMove))];

            uint256 points = pointsPerMove[myMove] + pointsPerGameResult[result];
            totalPoints += points;
        }

        return totalPoints;
    }
}
