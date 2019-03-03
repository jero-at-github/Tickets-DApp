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
    }
  }
  /*
  ,
  compilers: {
    solc: {
      version: "0.4.24"
    }
 }
 */
};