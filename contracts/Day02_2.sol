pragma solidity ^0.8.9;

import "@openzeppelin/contracts/utils/math/Math.sol";
import "hardhat/console.sol";
import "./strings.sol";
import "./utils.sol";

contract Day02_2 {
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
    mapping(string => GAME_RESULT) public str2gameresult;
    mapping(MOVE => uint256) public pointsPerMove;
    mapping(GAME_RESULT => uint256) public pointsPerGameResult;
    mapping(bytes32 => MOVE) public gameCombinaisons;

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
        str2gameresult["X"] = GAME_RESULT.LOSS;
        str2gameresult["Y"] = GAME_RESULT.DRAW;
        str2gameresult["Z"] = GAME_RESULT.WIN;
        gameCombinaisons[keccak256(abi.encodePacked(MOVE.ROCK, GAME_RESULT.DRAW))] = MOVE.ROCK;
        gameCombinaisons[keccak256(abi.encodePacked(MOVE.ROCK, GAME_RESULT.WIN))] = MOVE.PAPER;
        gameCombinaisons[keccak256(abi.encodePacked(MOVE.ROCK, GAME_RESULT.LOSS))] = MOVE.SCISSORS;
        gameCombinaisons[keccak256(abi.encodePacked(MOVE.PAPER, GAME_RESULT.DRAW))] = MOVE.PAPER;
        gameCombinaisons[keccak256(abi.encodePacked(MOVE.PAPER, GAME_RESULT.WIN))] = MOVE.SCISSORS;
        gameCombinaisons[keccak256(abi.encodePacked(MOVE.PAPER, GAME_RESULT.LOSS))] = MOVE.ROCK;
        gameCombinaisons[keccak256(abi.encodePacked(MOVE.SCISSORS, GAME_RESULT.DRAW))] = MOVE.SCISSORS;
        gameCombinaisons[keccak256(abi.encodePacked(MOVE.SCISSORS, GAME_RESULT.WIN))] = MOVE.ROCK;
        gameCombinaisons[keccak256(abi.encodePacked(MOVE.SCISSORS, GAME_RESULT.LOSS))] = MOVE.PAPER;
    }

    function run(string memory s) external view returns (uint256) {
        strings.slice memory input = s.toSlice();

        strings.slice memory delimBreak = "\n".toSlice();
        strings.slice memory delimSpace = " ".toSlice();

        uint256 totalPoints = 0;
        while (!input.empty()) {
            strings.slice memory round = input.split(delimBreak);
            MOVE opponentMove = str2move[round.split(delimSpace).toString()];
            GAME_RESULT gameResult = str2gameresult[round.split(delimSpace).toString()];
            MOVE myMove = gameCombinaisons[keccak256(abi.encodePacked(opponentMove, gameResult))];

            uint256 points = pointsPerMove[myMove] + pointsPerGameResult[gameResult];
            totalPoints += points;
        }

        return totalPoints;
    }
}