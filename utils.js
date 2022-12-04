const { readFile } = require("fs/promises");

const deployLibContract = async (name) => {
  const lib = await ethers.getContractFactory(name);
  return await lib.deploy();
};

const deployContract = async (name, libs) => {
  const contract = await ethers.getContractFactory(name, { libraries: libs });
  return await contract.deploy();
};

const readFileContent = async (path) => {
  return await readFile(path, "utf8");
}

var Utils = {
  deployFullContract: async (name) => {
    const utilsContract = await deployLibContract("utils");
    return await deployContract(name, {
      utils: utilsContract.address,
    });
  },
  runContract: async (inputPath, contract) => {
    const input = await readFileContent(inputPath);
    return await contract.run(input);
  },
};

module.exports = Utils;
