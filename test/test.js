const { expect } = require("chai");
const utils = require("../utils");

describe("AdventOfCode", function () {
  it("Day 01", async function () {
    const contract = await utils.deployFullContract("Day01", true)
    const solution = await utils.runContract("resources/day01-input-sample.txt", contract)

    expect(solution).to.equal(24000)
  });

  it("Day 02", async function () {
    const contract = await utils.deployFullContract("Day02", false)
    const solution = await utils.runContract("resources/day02-input-sample.txt", contract)

    expect(solution).to.equal(15)
  });
});
