pragma solidity ^0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'OrganizerRole' to manage this role - add, remove, check
contract OrganizerRole {
  using Roles for Roles.Role;

  // Define 2 events, one for Adding, and other for Removing
  event OrganizerAdded(address indexed account);
  event OrganizerRemoved(address indexed account);

  // Define a struct 'organizers' by inheriting from 'Roles' library, struct Role
  Roles.Role private organizers;

  // In the constructor make the address that deploys this contract the 1st organizer
  constructor() public {
    _addOrganizer(msg.sender);
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyOrganizer() {
    require(isOrganizer(msg.sender));
    _;
  }

  // Define a function 'isOrganizer' to check this role
  function isOrganizer(address account) public view returns (bool) {
    return organizers.has(account);
  }

  // Define a function 'addOrganizer' that adds this role
  function addOrganizer(address account) public onlyOrganizer {
    _addOrganizer(account);
  }

  // Define a function 'renounceOrganizer' to renounce this role
  function renounceOrganizer() public {
    _removeOrganizer(msg.sender);
  }

  // Define an internal function '_addOrganizer' to add this role, called by 'addOrganizer'
  function _addOrganizer(address account) internal {
    organizers.add(account);
    emit OrganizerAdded(account);
  }

  // Define an internal function '_removeOrganizer' to remove this role, called by 'removeOrganizer'
  function _removeOrganizer(address account) internal {
    organizers.remove(account);
    emit OrganizerRemoved(account);
  }
}