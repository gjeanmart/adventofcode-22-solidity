const { expect } = require("chai");
const utils = require("../utils");

describe("AdventOfCode", function () {
  it("Day 01", async function () {
    const contract = await utils.deployFullContract("Day01", true)
    const solution = await utils.runContract("resources/day01-input-sample.txt", contract)

    expect(solution).to.equal(24000)
  });

  it("Day 02 - part 1", async function () {
    const contract = await utils.deployFullContract("Day02_1", false)
    const solution = await utils.runContract("resources/day02-input-sample.txt", contract)

    expect(solution).to.equal(15)
  });

  it("Day 02 - part 2", async function () {
    const contract = await utils.deployFullContract("Day02_2", false)
    const solution = await utils.runContract("resources/day02-input-sample.txt", contract)

    expect(solution).to.equal(12)
  });

  it("Day 03", async function () {
    const contract = await utils.deployFullContract("Day03", false)
    const solution = await utils.runContract("resources/day03-input-sample.txt", contract)

    expect(solution).to.equal(12)
  });
});
