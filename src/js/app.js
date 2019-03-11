App = {
    web3Provider: null,
    contracts: {},
    emptyAddress: "0x0000000000000000000000000000000000000000",        
    metamaskAccountID: "0x0000000000000000000000000000000000000000",

    init: async function () {       
        /// Setup access to blockchain
        return await App.initWeb3();
    },

    initWeb3: async function () {
        /// Find or Inject Web3 Provider
        /// Modern dapp browsers...
        if (window.ethereum) {
            App.web3Provider = window.ethereum;
            try {
                // Request account access
                await window.ethereum.enable();
            } catch (error) {
                // User denied account access...
                console.error("User denied account access")
            }
        }
        // Legacy dapp browsers...
        else if (window.web3) {
            App.web3Provider = window.web3.currentProvider;
        }
        // If no injected web3 instance is detected, fall back to Ganache
        else {
            App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
        }

        // Detect when there is a change of account in Metamask
        App.web3Provider.publicConfigStore.on('update', (response) => {     

            App.metamaskAccountID = response.selectedAddress;  
            console.log("Metamask account changes: " + response.selectedAddress);
        });        

        return App.initSupplyChain();
    },             

    initSupplyChain: function () {
        /// Source the truffle compiled smart contracts
        var jsonSupplyChain='../../build/contracts/SupplyChain.json';
        
        /// JSONfy the smart contracts
        $.getJSON(jsonSupplyChain, function(data) {
            console.log('data',data);
            var SupplyChainArtifact = data;
            App.contracts.SupplyChain = TruffleContract(SupplyChainArtifact);
            App.contracts.SupplyChain.setProvider(App.web3Provider);            
        });

        return App.bindEvents();
    },

    bindEvents: function() {
        $(document).on('click', App.handleButtonClick);
    },

    handleButtonClick: async function(event) {
        
        event.preventDefault();        

        var processId = parseInt($(event.target).data('id'));
        console.log('processId',processId);

        switch(processId) {
            case 1:
                return await App.createOrganizedEvent(event);
                break;
            case 2:
                return await App.fetchOrganizedEvent(event);
                break;
            case 3:
                return await App.createTicket(event);
                break;
            case 4:
                return await App.fetchTicket(event);
                break;
            case 5:
                return await App.putTicketForSale(event);
                break;
            case 6:
                return await App.buyTicket(event);
                break;
            case 7:
                return await App.validateTicket(event);
                break;            
            }
    },    

    createOrganizedEvent: function(event) {

        event.preventDefault();      

        App.contracts.SupplyChain.deployed().then(function(instance) {
            return instance.createOrganizedEvent(
                $("#originOrganizerID").val(), 
                $("#originOrganizerName").val(), 
                $("#originOrganizerInformation").val()
            );
        }).then(function(result) {
            $("#console").text(result);
            console.log('createOrganizedEvent',result);
        }).catch(function(err) {
            console.log(err.message);
        });
    },

    createTicket: function(event) {
        
        event.preventDefault();        

        App.contracts.SupplyChain.deployed().then(function(instance) {
            return instance.createTicket(     
                $("#ticket_organizedEventID").val(), 
                $("#productNotes").val(),
                $("#validatorID").val()
            );
        }).then(function(result) {
            $("#console").text(result);
            console.log('createTicket',result);
        }).catch(function(err) {
            console.log(err.message);
        });
    },

    putTicketForSale: function (event) {        

        App.contracts.SupplyChain.deployed().then(function(instance) {
            let productPrice = web3.toWei($("#price").val(), "ether");            
            return instance.sellItem($("#upc").val(), productPrice, {from: App.metamaskAccountID});
        }).then(function(result) {
            $("#console").text(result);
            console.log('putTicketForSale',result);
        }).catch(function(err) {
            console.log(err.message);
        });
    },

    /*
   
    buyItem: function (event) {
        event.preventDefault();
        var processId = parseInt($(event.target).data('id'));

        App.contracts.SupplyChain.deployed().then(function(instance) {
            const walletValue = web3.toWei(3, "ether");
            return instance.buyItem(App.upc, {from: App.metamaskAccountID, value: walletValue});
        }).then(function(result) {
            $("#console").text(result);
            console.log('buyItem',result);
        }).catch(function(err) {
            console.log(err.message);
        });
    },   
    
    */

    fetchTicket: function () {          

        App.contracts.SupplyChain.deployed().then(function(instance) {
          return instance.fetchTicket($("#upc").val());
        }).then(function(result) {
          $("#console").text(result);
          console.log('fetchTicket', result);
        }).catch(function(err) {
          console.log(err.message);
        });
    },

    fetchOrganizedEvent: function () {        

        App.contracts.SupplyChain.deployed().then(function(instance) {
          return instance.fetchOrganizedEvent.call($("#event_organizedEventId").val());
        }).then(function(result) {
          $("#console").text(result);
          console.log('fetchOrganizedEvent', result);
        }).catch(function(err) {
          console.log(err.message);
        });
    },

    fetchEvents: function () {
        if (typeof App.contracts.SupplyChain.currentProvider.sendAsync !== "function") {
            App.contracts.SupplyChain.currentProvider.sendAsync = function () {
                return App.contracts.SupplyChain.currentProvider.send.apply(
                App.contracts.SupplyChain.currentProvider,
                    arguments
              );
            };
        }

        App.contracts.SupplyChain.deployed().then(function(instance) {
        var events = instance.allEvents(function(err, log){
          if (!err)
            $("#ftc-events").append('<li>' + log.event + ' - ' + log.transactionHash + '</li>');
        });
        }).catch(function(err) {
          console.log(err.message);
        });
        
    }
};

$(function () {
    $(window).load(function () {
        App.init();
    });
});