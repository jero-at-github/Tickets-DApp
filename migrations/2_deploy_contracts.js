// migrating the appropriate contracts
var OrganizerRole = artifacts.require("./OrganizerRole.sol");
var ValidatorRole = artifacts.require("./ValidatorRole.sol");
var AttendeeRole = artifacts.require("./AttendeeRole.sol");
var SupplyChain = artifacts.require("./SupplyChain.sol");

module.exports = function(deployer) {
  deployer.deploy(OrganizerRole);
  deployer.deploy(ValidatorRole);
  deployer.deploy(AttendeeRole);
  deployer.deploy(SupplyChain);
};
