const { expect } = require("chai");
const utils = require("../utils");

describe("AdventOfCode", function () {
  it("Day 01", async function () {
    const input = await utils.readFileContent("resources/day01-input01.txt")
    const contract = await utils.deployFullContract("Day01")

    expect(await contract.run(input)).to.equal(24000)
  });
});
