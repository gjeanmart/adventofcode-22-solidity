require("@nomicfoundation/hardhat-toolbox");
const utils = require("./utils");

task(
  "day01",
  "Find the Elf carrying the most Calories. How many total Calories is that Elf carrying?"
).setAction(async (_taskArgs) => {
  const input = await utils.readFileContent("resources/day01-input02.txt");
  const utilsContract = await utils.deployLibContract("utils");
  const day01Contract = await utils.deployContract("Day01", {
    utils: utilsContract.address,
  });
  const result = await day01Contract.countCalories(input);
  console.log("RESULT DAY01=" + result);
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
