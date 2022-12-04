const { readFile } = require("fs/promises");

var Utils = {
  readFileContent: async (path) => {
    return await readFile(path, "utf8");
  },

  deployLibContract: async (name) => {
    const lib = await ethers.getContractFactory(name);
    return await lib.deploy();
  },

  deployContract: async (name, libs) => {
    const contract = await ethers.getContractFactory(name, { libraries: libs });
    return await contract.deploy();
  },
};

module.exports = Utils;
