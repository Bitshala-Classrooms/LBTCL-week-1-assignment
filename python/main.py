from bitcoinrpc.authproxy import AuthServiceProxy, JSONRPCException

def main():

    try:
        # Connect to Bitcoin Core RPC with basic credentials
        rpc_user = "alice"
        rpc_password = "password"
        rpc_host = "127.0.0.1"
        rpc_port = 18443
        base_rpc_url = f"http://{rpc_user}:{rpc_password}@{rpc_host}:{rpc_port}"

        # General client for non-wallet-specific commands
        client = AuthServiceProxy(base_rpc_url)

        # Get blockchain info
        blockchain_info = client.getblockchaininfo()
        print("Blockchain Info:", blockchain_info)

        # Create/Load the wallets, named 'Miner' and 'Trader'. Have logic to optionally create/load them if they do not exist or are not loaded already.

        # Generate spendable balances in the Miner wallet. Determine how many blocks need to be mined.

        # Load the Trader wallet and generate a new address.

        # Send 20 BTC from Miner to Trader.

        # Check the transaction in the mempool.

        # Mine 1 block to confirm the transaction.

        # Extract all required transaction details.

        # Write the data to ../out.txt in the specified format given in readme.md.

if __name__ == "__main__":
    main()