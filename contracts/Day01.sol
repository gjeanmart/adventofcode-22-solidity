pragma solidity ^0.8.9;

import "@openzeppelin/contracts/utils/math/Math.sol";
import "hardhat/console.sol";
import "./strings.sol";
import "./utils.sol";

contract Day01 {
    using strings for *;
    using Math for uint256;

    function run(string memory s) external pure returns (uint256) {
        strings.slice memory input = s.toSlice();
        strings.slice memory delim1 = "\n\n".toSlice();
        strings.slice memory delim2 = "\n".toSlice();

        uint256 biggestElfHolderCal = 0;

        while (!input.empty()) {
            strings.slice memory elfCals = input.split(delim1);
            uint256 totalCalCarriedByEft = 0;

            while (!elfCals.empty()) {
                strings.slice memory calory = elfCals.split(delim2);
                uint256 cal = utils.st2num(calory.toString());
                totalCalCarriedByEft = totalCalCarriedByEft + cal;
            }
            biggestElfHolderCal = Math.max(
                biggestElfHolderCal,
                totalCalCarriedByEft
            );
        }

        return biggestElfHolderCal;
    }
}
