
var HDWalletProvider = require('truffle-hdwallet-provider');

var mnemonic = 'embark clarify seven matter sauce then poet math hammer recycle business social';

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*" // Match any network id
    },
    ganache_ui: {
        host: "localhost",
        port: 7545,
        network_id: "*" // Match any network id
    },
    rinkeby: {
        provider: function() { 
            return new HDWalletProvider(mnemonic, 'https://rinkeby.infura.io/v3/8da2ccf1f93e4660a6a9d1fabbf4ffd0')                                                    
        },
        network_id: 4,
        gas: 4500000,
        gasPrice: 10000000000,
    }
  },
  compilers: {
    solc: {
      version: "0.4.24"
    }
  } 
};