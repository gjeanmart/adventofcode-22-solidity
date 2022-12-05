pragma solidity ^0.8.9;

import "@openzeppelin/contracts/utils/math/Math.sol";
import "hardhat/console.sol";
import "./strings.sol";
import "./utils.sol";

contract Day03 {
    using strings for *;
    using Math for uint256;

    function run(string memory s) external pure returns (uint256) {
        strings.slice memory input = s.toSlice();
        strings.slice memory delimBreak = "\n".toSlice();

        while (!input.empty()) {
            strings.slice memory elfCals = input.split(delimBreak);

        }

        return 0;
    }
}
