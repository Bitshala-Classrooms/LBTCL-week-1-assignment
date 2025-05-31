# Get blockchain info using bitcoin-cli
blockchain_info=$(bitcoin-cli getblockchaininfo)

# Print the blockchain info
echo "$blockchain_info"

# Create/Load the wallets, named 'Miner' and 'Trader'. Have logic to optionally create/load them if they do not exist or not loaded already.

# Generate spendable balances in the Miner wallet. How many blocks needs to be mined?

# Load Trader wallet and generate a new address

# Send 20 BTC from Miner to Trader

# Check transaction in mempool

# Mine 1 block to confirm the transaction

# Extract all required transaction details

# Write the data to ../out.txt in the specified format given in readme.md