const { readFile } = require("fs/promises");

const readFileContent = async (path) => {
  return await readFile(path, "utf8");
};

const deployLibContract = async (name) => {
  const lib = await ethers.getContractFactory(name);
  return await lib.deploy();
};

const deployContract = async (name, libs) => {
  const contract = await ethers.getContractFactory(name, { libraries: libs });
  return await contract.deploy();
};

const deployFullContract = async (name, withLib) => {
  if (withLib) {
    const utilsContract = await deployLibContract("utils");
    return await deployContract(name, {
      utils: utilsContract.address,
    });
  }
  return await deployContract(name);
};

const runContract = async (inputPath, contract) => {
  const input = await readFileContent(inputPath);
  return await contract.run(input);
};

module.exports.deployFullContract = deployFullContract;
module.exports.runContract = runContract;
