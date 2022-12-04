pragma solidity ^0.8.9;

import "@openzeppelin/contracts/utils/math/Math.sol";
import "hardhat/console.sol";
import "./strings.sol";
import "./utils.sol";

contract Day01 {
    using strings for *;
    using Math for uint256;

    function run(string memory s)
        external
        pure
        returns (uint256)
    {
        strings.slice memory input = s.toSlice();
        strings.slice memory delim1 = "\n\n".toSlice();
        strings.slice memory delim2 = "\n".toSlice();

        uint biggestElfHolderCal = 0;

        while (!input.empty()) {
            strings.slice memory elf = input.split(delim1);
            uint totalCarriedByEft = 0;

            while (!elf.empty()) {
                strings.slice memory calory = elf.split(delim2);
                uint256 cal = utils.st2num(calory.toString());
                totalCarriedByEft = totalCarriedByEft + cal;
            }
            biggestElfHolderCal = Math.max(biggestElfHolderCal, totalCarriedByEft);
        }

        return biggestElfHolderCal;
    }
}
