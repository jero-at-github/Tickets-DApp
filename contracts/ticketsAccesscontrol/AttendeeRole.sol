pragma solidity ^0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'AttendeeRole' to manage this role - add, remove, check
contract AttendeeRole {
  using Roles for Roles.Role;

  // Define 2 events, one for Adding, and other for Removing
  event AttendeeAdded(address indexed account);
  event AttendeeRemoved(address indexed account);

  // Define a struct 'attendees' by inheriting from 'Roles' library, struct Role
  Roles.Role private attendees;

  // In the constructor make the address that deploys this contract the 1st attendee
  constructor() public {
    _addAttendee(msg.sender);
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyAttendee() {
    require(isAttendee(msg.sender));
    _;
  }

  // Define a function 'isAttendee' to check this role
  function isAttendee(address account) public view returns (bool) {
    return attendees.has(account);
  }

  // Define a function 'addAttendee' that adds this role
  function addAttendee(address account) public onlyAttendee {
    _addAttendee(account);
  }

  // Define a function 'renounceAttendee' to renounce this role
  function renounceAttendee() public {
    _removeAttendee(msg.sender);
  }

  // Define an internal function '_addAttendee' to add this role, called by 'addAttendee'
  function _addAttendee(address account) internal {
    attendees.add(account);
    emit AttendeeAdded(account);
  }

  // Define an internal function '_removeAttendee' to remove this role, called by 'removeAttendee'
  function _removeAttendee(address account) internal {
    attendees.remove(account);
    emit AttendeeRemoved(account);
  }
}