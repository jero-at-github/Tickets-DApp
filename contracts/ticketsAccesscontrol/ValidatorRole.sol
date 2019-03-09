pragma solidity ^0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'ValidatorRole' to manage this role - add, remove, check
contract ValidatorRole {
  using Roles for Roles.Role;

  // Define 2 events, one for Adding, and other for Removing
  event ValidatorAdded(address indexed account);
  event ValidatorRemoved(address indexed account);

  // Define a struct 'validators' by inheriting from 'Roles' library, struct Role
  Roles.Role private validators;

  // In the constructor make the address that deploys this contract the 1st validator
  constructor() public {
    _addValidator(msg.sender);
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyValidator() {
    require(isValidator(msg.sender));
    _;
  }

  // Define a function 'isValidator' to check this role
  function isValidator(address account) public view returns (bool) {
    return validators.has(account);
  }

  // Define a function 'addValidator' that adds this role
  function addValidator(address account) public onlyValidator {
    _addValidator(account);
  }

  // Define a function 'renounceValidator' to renounce this role
  function renounceValidator() public {
    _removeValidator(msg.sender);
  }

  // Define an internal function '_addValidator' to add this role, called by 'addValidator'
  function _addValidator(address account) internal {
    validators.add(account);
    emit ValidatorAdded(account);
  }

  // Define an internal function '_removeValidator' to remove this role, called by 'removeValidator'
  function _removeValidator(address account) internal {
    validators.remove(account);
    emit ValidatorRemoved(account);
  }
}