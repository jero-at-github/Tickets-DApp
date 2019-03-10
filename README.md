## Solidity smart contracts (Tickets - DApp)

#### Project description

The target of this project is to build a supply chain application applied to the sell of events tickets (music events, sport events, etc...)
Diagrams are included in the folder "diagrams" including:
*  Activity diagram
*  Sequence diagram
*  State diagram
*  Classes (Data Model) diagram

#### Libraries

*  solc ^0.4.24 : This library is used to avoid error and warnings from Visual Studio Code, which uses by default the Solidity Compiler version 5. 
*  truffle-hdwallet-provider ^0.0.6 : This library is used to connect to Infura and pass our mnemonic.
*  truffle-assertions ^0.8.0: I am using this library to assert in a more efficient and clear way the solidity events from the tests.

#### Rinkeby deployment information

Contract was deployed in Rinkeby with the hash: 0xf8901797619b8822880b57237c7825efb48b42f8 

#### General Write Up

#### Usage instructions

To run the UI: 
1.  ```npm install```
2.  ```npm run webapp```

To deploy in local environment:
1.  ```npm run deploy-web```

To deploy in rinkeby environment:
1.  ```npm run deploy-rinkeby```

To test the contracts:
1.  ```npm run test```