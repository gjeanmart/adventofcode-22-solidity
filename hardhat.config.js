require("@nomicfoundation/hardhat-toolbox");
const utils = require("./utils");

task("solve-puzzle", "Solve Advent of Code puzzle")
  .addParam("day", "Which day?")
  .addParam("withlib", "Include lib in the contact deployment?")
  .setAction(async (taskArgs) => {
    const contract = await utils.deployFullContract(
      "Day" + taskArgs.day,
      JSON.parse(taskArgs.withlib)
    );
    const solution = await utils.runContract(
      "resources/day" + taskArgs.day + "-input.txt",
      contract
    );
    console.log(
      "=> solution for puzzle Day " + taskArgs.day + " : " + solution
    );
  });

module.exports = {
  solidity: "0.8.17",
  defaultNetwork: "hardhat",
  networks: {
    hardhat: {
      blockGasLimit: 100000000000000, // a lot to prevent OutOfGas (ok, it's just for fun!!!)
    },
  },
  mocha: {
    timeout: 300000,
  },
};
