pragma solidity ^0.4.24;

// Define a contract 'Supplychain'
contract SupplyChain {

  // Define 'owner'
  address owner;

  // Define a variable called 'upc' for Universal Product Code (UPC)
  uint  upc;

  // Define a public mapping 'tickets' that maps the UPC to an Item.
  mapping (uint => Ticket) tickets;

  // Define a public mapping 'ticketsHistory' that maps the UPC to an array of TxHash, 
  // that track its journey through the supply chain -- to be sent from DApp.
  mapping (uint => string[]) ticketsHistory;
  
  // Define enum 'State' with the following values:
  enum State 
  { 
    Created,  // 0
    ForSale,  // 1
    Sold,     // 2
    Allowed   // 3    
  }

  State constant defaultState = State.Created;

  // Define a struct 'Item' with the following fields:
  struct Ticket {    
    uint    upc;                    // Universal Product Code (UPC), generated by the Organizer, goes on the package, can be verified by the Consumer
    address ownerID;                // Metamask-Ethereum address of the current owner as the product moves through 4 stages
    address originOrganizerID;      // Metamask-Ethereum address of the Organizer
    string  originOrganizerName;    // Organizer Name
    string  originOrganizerInformation;  // Organizer Information    
    string  productNotes;           // Product Notes
    uint    productPrice;           // Product Price
    State   itemState;              // Product State as represented in the enum above
    address validatorID;            // Metamask-Ethereum address of the Validator
    address consumerID;             // Metamask-Ethereum address of the Consumer
  }

  // Define 4 events with the same 4 state values and accept 'upc' as input argument
  event Created(uint upc);
  event ForSale(uint upc);
  event Sold(uint upc);  
  event Allowed(uint upc);

  // Define a modifer that checks to see if msg.sender == owner of the contract
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  // Define a modifer that verifies the Caller
  modifier verifyCaller (address _address) {
    require(msg.sender == _address); 
    _;
  }

  // Define a modifier that checks if the paid amount is sufficient to cover the price
  modifier paidEnough(uint _price) { 
    require(msg.value >= _price); 
    _;
  }
  
  // Define a modifier that checks the price and refunds the remaining balance
  modifier checkValue(uint _upc) {
    _;
    uint _price = tickets[_upc].productPrice;
    uint amountToReturn = msg.value - _price;
    tickets[_upc].consumerID.transfer(amountToReturn);
  }

  // Define a modifier that checks if an item.state of a upc is Harvested
  modifier created(uint _upc) {
    require(tickets[_upc].itemState == State.Created);
    _;
  }

  // Define a modifier that checks if an item.state of a upc is Processed
  modifier forSale(uint _upc) {
    require(tickets[_upc].itemState == State.ForSale);
    _;
  }
  
  // Define a modifier that checks if an item.state of a upc is Packed
  modifier sold(uint _upc) {
    require(tickets[_upc].itemState == State.Sold);
    _;
  }
  
  // Define a modifier that checks if an item.state of a upc is Shipped
  modifier allowed(uint _upc) {
    require(tickets[_upc].itemState == State.Allowed);
    _;
  }

  // In the constructor set 'owner' to the address that instantiated the contract  
  // and set 'upc' to 1
  constructor() public payable {
    owner = msg.sender;    
    upc = 0;
  }

  // Define a function 'kill' if required
  function kill() public {
    if (msg.sender == owner) {
      selfdestruct(owner);
    }
  }

  // Define a function 'create' that allows a organizer to create a ticket
  function create(address _originOrganizerID, string _originOrganizerName, string _originOrganizerInformation, string  _productNotes, uint _productPrice) public 
  {   
    // Increment upc  
    upc = upc + 1;           

    // Create new ticket
    Ticket memory newTicket;
        
    newTicket.ownerID = _originOrganizerID;
    newTicket.upc = upc;
    newTicket.originOrganizerID = _originOrganizerID;
    newTicket.originOrganizerName = _originOrganizerName;
    newTicket.originOrganizerInformation = _originOrganizerInformation;
    newTicket.productNotes = _productNotes;
    newTicket.productPrice = _productPrice;
    newTicket.itemState = State.Created;

    // Persist the new createad ticket
    tickets[upc] = newTicket;

    // Emit the appropriate event
    emit Created(upc);
  }

  // Define a function 'processtItem' that allows a farmer to mark an item 'Processed'
  function processItem(uint _upc) public 
  // Call modifier to check if upc has passed previous supply chain stage
  
  // Call modifier to verify caller of this function
  
  {
    // Update the appropriate fields
    
    // Emit the appropriate event
    
  }

  // Define a function 'packItem' that allows a farmer to mark an item 'Packed'
  function packItem(uint _upc) public 
  // Call modifier to check if upc has passed previous supply chain stage
  
  // Call modifier to verify caller of this function
  
  {
    // Update the appropriate fields
    
    // Emit the appropriate event
    
  }

  // Define a function 'sellItem' that allows a farmer to mark an item 'ForSale'
  function sellItem(uint _upc, uint _price) public 
  // Call modifier to check if upc has passed previous supply chain stage
  
  // Call modifier to verify caller of this function
  
  {
    // Update the appropriate fields
    
    // Emit the appropriate event
    
  }

  // Define a function 'buyItem' that allows the disributor to mark an item 'Sold'
  // Use the above defined modifiers to check if the item is available for sale, if the buyer has paid enough, 
  // and any excess ether sent is refunded back to the buyer
  function buyItem(uint _upc) public payable 
    // Call modifier to check if upc has passed previous supply chain stage
    
    // Call modifer to check if buyer has paid enough
    
    // Call modifer to send any excess ether back to buyer
    
    {
    
    // Update the appropriate fields - ownerID, distributorID, itemState
    
    // Transfer money to farmer
    
    // emit the appropriate event
    
  }

  // Define a function 'shipItem' that allows the distributor to mark an item 'Shipped'
  // Use the above modifers to check if the item is sold
  function shipItem(uint _upc) public 
    // Call modifier to check if upc has passed previous supply chain stage
    
    // Call modifier to verify caller of this function
    
    {
    // Update the appropriate fields
    
    // Emit the appropriate event
    
  }

  // Define a function 'receiveItem' that allows the retailer to mark an item 'Received'
  // Use the above modifiers to check if the item is shipped
  function receiveItem(uint _upc) public 
    // Call modifier to check if upc has passed previous supply chain stage
    
    // Access Control List enforced by calling Smart Contract / DApp
    {
    // Update the appropriate fields - ownerID, retailerID, itemState
    
    // Emit the appropriate event
    
  }

  // Define a function 'purchaseItem' that allows the consumer to mark an item 'Purchased'
  // Use the above modifiers to check if the item is received
  function purchaseItem(uint _upc) public 
    // Call modifier to check if upc has passed previous supply chain stage
    
    // Access Control List enforced by calling Smart Contract / DApp
    {
    // Update the appropriate fields - ownerID, consumerID, itemState
    
    // Emit the appropriate event
    
  }

  // Define a function 'fetchItemBufferOne' that fetches the data
  function fetchItemBufferOne(uint _upc) public view returns (    
    uint    upc,
    address ownerID,
    address originOrganizerID,
    string  originOrganizerName,
    string  originOrganizerInformation,
    string  productNotes,
    uint    productPrice,
    State   itemState,
    address validatorID,
    address consumerID)
  {    
    Ticket memory requestedTicket;
    requestedTicket = tickets[_upc];   
        
    return (        
        requestedTicket.upc,
        requestedTicket.ownerID,
        requestedTicket.originOrganizerID,
        requestedTicket.originOrganizerName,
        requestedTicket.originOrganizerInformation,
        requestedTicket.productNotes,
        requestedTicket.productPrice,
        requestedTicket.itemState,
        requestedTicket.validatorID,
        requestedTicket.consumerID
    );
  }
}
