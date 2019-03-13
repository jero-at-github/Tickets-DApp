## Solidity smart contracts (Tickets - DApp)

#### Project description

The target of this project is to build a supply chain application applied to the sell of events tickets (music events, sport events, etc...)
Diagrams are included in the folder "diagrams" including:
*  Activity diagram
*  Sequence diagram
*  State diagram
*  Classes (Data Model) diagram

### Versions

*  Program version number: 1.0.0
*  Node version number: v8.11.4
*  Truffle version number: Truffle v4.1.15 (core: 4.1.15)
*  Web3 version number: 0.18.4

#### Libraries

Node.js:
*  solc ^0.4.24 : This library is used to avoid error and warnings from Visual Studio Code, which uses by default the Solidity Compiler version 5. 
*  truffle-hdwallet-provider ^0.0.6 : This library is used to connect to Infura and pass our mnemonic.
*  truffle-assertions ^0.8.0: I am using this library to assert in a more efficient and clear way the solidity events from the tests.

Others:
*  Bootstrap 4.3.1: To add responsive design

#### Rinkeby deployment information

Contract was deployed in Rinkeby with the hash: 0x8f692c347fd2ee1d304d0442a807802ba47f43b1 
Contract owner: 0x4348e2F2ac596e44E6A6D4151aE84e4aA4126A8d

#### General Write Up



#### Usage instructions

To run the UI: 
1.  Please, create in Metamask 3 accounts for each of the respectives roles: Events organizer, Attendee, Validator
2.  Replace in app.js the 3 created accounts in the corresponding App object varibales (organizerID, validatorID, consumerID)
3.  ```npm install```
4.  ```npm run webapp```

To deploy in local environment:
1.  ```npm run deploy-web```

To deploy in rinkeby environment:
1.  ```npm run deploy-rinkeby```

To test the contracts:
1.  ```npm run test```