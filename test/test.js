const { expect } = require("chai");
const utils = require("../utils");

describe("AdventOfCode", function () {
  it("Day 01", async function () {
    const contract = await utils.deployFullContract("Day01")
    const solution = await utils.runContract("resources/day01-input01.txt", contract)

    expect(solution).to.equal(24000)
  });
});
