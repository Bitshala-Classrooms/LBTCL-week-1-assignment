const Client = require('bitcoin-core');
const fs = require('fs');

const client = new Client({
    network: 'regtest',
    username: 'alice',
    password: 'password',
    host: '127.0.0.1', // Host should not include the protocol
    port: 18443 // Ensure the correct port for regtest is used
});

async function main() {
    // Example: Get blockchain info
    const blockchainInfo = await client.getBlockchainInfo();
    console.log('Blockchain Info:', blockchainInfo);
    
    // Create/Load the wallets, named 'Miner' and 'Trader'. Have logic to optionally create/load them if they do not exist or not loaded already.

    // Generate spendable balances in the Miner wallet. How many blocks needs to be mined?
    
    // Load Trader wallet and generate a new address
    
    // Send 20 BTC from Miner to Trader
    
    // Check transaction in mempool
    
    // Mine 1 block to confirm the transaction
    
    // Extract all required transaction details
    
    // Write the data to ../out.txt in the specified format given in readme.md
}

main();