## Solidity smart contracts (Tickets - DApp)

#### Project description

The target of this project is to build a supply chain application applied to the sell of events tickets (music events, sport events, etc...)
Diagrams are included in the folder "diagrams" including:
*  Activity diagram
*  Sequence diagram
*  State diagram
*  Classes (Data Model) diagram

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

Contract was deployed in Rinkeby with the hash address:     0x79d4fb82aa116cc1820bca1a4607d4fdba530d72
Contract was deployed in Rinkeby with the hash transaction: 0x5768f3aaca172764901b4d7b9210f7632fd7107729b0c9ce8877c1776d28cf81
Contract owner: 0x4348e2F2ac596e44E6A6D4151aE84e4aA4126A8d

#### General Write Up

1.  Please, create in Metamask 3 accounts for each of the respectives roles: Events organizer, Attendee, Validator (ensure they have some gas to execute the calls)
2.  [Optional] Replace in app.js the 3 created account addresses in the corresponding App object varibales (organizerID, validatorID, consumerID)
    ```
    organizerID: "",
    validatorID: "",
    consumerID: "",
    ```
    This will populate for you the corresponding values in the UI fields. Otherwise you have to type them manually.  

3.  From the Metamask contract owner address create a Organized Event   
4.  From the Metamask organizer address create a ticket
5.  From the Metamask organizer address put a ticket for sell
6.  From the Metamask attendee (consumer) address buy a ticket
7.  From the Metamask validator address validate a ticket

