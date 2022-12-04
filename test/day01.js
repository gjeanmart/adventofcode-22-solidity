const { expect } = require("chai");
const utils = require("../utils");

describe("Day 01 - Calorie Counting", function () {
  it("should return the max calories carried by an Elf (input01 - sample)", async function () {
    const input = await utils.readFileContent(
      "resources/day01-input01.txt"
    );
    const utilsContract = await utils.deployLibContract("utils");
    const day01Contract = await utils.deployContract("Day01", {
      utils: utilsContract.address,
    });
    expect(await day01Contract.countCalories(input)).to.equal(24000);
  });
});
