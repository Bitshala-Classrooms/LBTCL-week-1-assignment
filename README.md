# Learning Bitcoin from the Command Line - Week 1: Setting up and interacting with a Bitcoin Node

## Overview
This week, you'll learn how to install Bitcoin Core and use Bitcoin CLI (`bitcoin-cli`) to interact with a running Bitcoin node.

## Problem Statement

The starting steps of any automated node software (Umbrel, MyNode, Raspibltiz etc) is to download the bitcoin binaries, verify signatures, install them in correct locations, provide specific user access, and then start the node.
The node will then go into IBD (Initial Block Download) phase, where it will download and validate the whole Bitcoin blockchain. Once the IBD completes, it will initiate a wallet and then the user can start transacting Bitcoin with the node (via node UI, or connecting mobile wallets to the node).

The following exercise is the toy version of the same process via bash script.
We will not have to do IBD, because we will be using `regtest` where we can create our own toy blocks with toy transactions.

## Solution Requirements

You need to write a bash script that will do the following:

### Setup
- Download the latest Bitcoin Core binaries from Bitcoin Core Org https://bitcoincore.org/.
- Use the downloaded hashes and signature to verify that binary is right. Print a message to terminal "Binary signature verification successful".
- Copy the downloaded binaries to `/usr/local/bin/` for folder.

### Start Bitcoin Node
- Create a `bitcoin.conf` file in the `~/.bitcoin/` data directory. Create the directory if it doesn't exist. And add the following lines to the file.
  ```
  regtest=1
  fallbackfee=0.0001
  server=1
  rest=1
  txindex=1
  rpcauth=alice:88cae77e34048eff8b9f0be35527dd91$d5c4e7ff4dfe771808e9c00a1393b90d498f54dcab0ee74a2d77bd01230cd4cc
  ```
  Make sure that you escape the `$` sign in the `rpcauth` line.
- start `bitcoind`.
- create two wallet named `Miner` and `Trader`. The names are case-sensitive and should be exact.
- Generate one address from the `Miner` wallet with a label "Mining Reward".
- Mine new blocks to this address until you get positive wallet balance. (use `generatetoaddress`) (observe many blocks it took to get to a positive balance)
- Write a short comment describing why wallet balance for block rewards behaves that way.
- Print the balance of the `Miner` wallet.

### Usage
- Create a receiving addressed labeled "Received" from `Trader` wallet.
- Send a transaction paying 20 BTC from `Miner` wallet to `Trader`'s wallet.
- Fetch the unconfirmed transaction from the node's mempool and print the result. (hint: `bitcoin-cli help` to find list of all commands, look for `getmempoolentry`).
- Confirm the transaction by mining 1 block.


### Output
- Fetch the following details of the transaction and output them to a `out.txt` file in the following format. Each attribute should be on a new line.
  - `Transaction ID (txid)`
  - `Miner's Input Address`
  - `Miner's Input Amount (in BTC)`
  - `Trader's Output Address`
  - `Trader's Output Amount (in BTC)`
  - `Miner's Change Address`
  - `Miner's Change Amount (in BTC)`
  - `Transaction Fees (in BTC)`
  - `Block height at which the transaction is confirmed`
  - `Block hash at which the transaction is confirmed`


- Sample output file:
  ```
  57ecbb84fd3246ebcc734455fd30f5536637878b40fb2742d1a4fced3c28862c
  bcrt1qv5plgft75j0hegtvf6zs5pajh7k0gxg2dhj224
  50
  bcrt1qak6gpu2p6zjpwrhvd4dvdnp4rt3ysm9rpst3wu
  20
  bcrt1qxw3msnuqps0kgn6dprs9ldlz79yfj63swqupd0
  29.9999859
  -1.41e-05
  102
  3b821acd7c32c2b3da143e2c6b0134e5aa8206aeae0a54bfa4963e73ac2857a0
  ```

## Hints

- To download the latest binaries for linux x86-64, via command line: `wget https://bitcoincore.org/bin/bitcoin-core-27.1/bitcoin-27.1-x86_64-linux-gnu.tar.gz`
- Search up in google for terminal commands for a specific task, if you don't have them handy. Ex: "how to extract a zip folder via linux terminal", "how to copy files into another directory via linux terminal", etc.
- Use `jq` tool to fetch specific data from `json` objects returned by `bitcoin-cli`.

## Local Testing

### Prerequisites
- Install `jq` tool for parsing JSON data if you don't have it installed.
- Install Node.js and npm to run the test script.
- Node version 20 or higher is recommended. You can install Node.js using the following command:
  ```
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
  source ~/.nvm/nvm.sh
  nvm install 20
  ```
- Install the required npm packages by running `npm install`.

### Testing Steps
- Run your script using the command `/bin/bash solution.sh`.
- Run the test script using the command `npm run test`.
- The test script will run your script and verify the output. If the test script passes, you have successfully completed the challenge and are ready to submit your solution.

### Common Issues
- Make sure Bitcoin Core is running before running the test script. Your submission should not stop the Bitcoin Core daemon at any point.
- Make sure your `bitcoin.conf` file is correctly configured with the required parameters.
- Linux and MacOS are the recommended operating systems for this challenge. If you are using Windows, you may face compatibility issues.
- The autograder will run the test script on an Ubuntu 22.04 environment. Make sure your script is compatible with this environment.
- If you are unable to run the test script locally, you can submit your solution and check the results on the Github.


## Submission

- Write your solution in `solution.sh`. Make sure to include comments explaining each step of your code.
- Commit your changes and push to the main branch:
  - Add your changes by running `git add solution.sh`.
  - Commit the changes by running `git commit -m "Solution"`.
  - Push the changes by running `git push origin main`.
- The autograder will run your script against a test script to verify the functionality.
- Check the status of the autograder on the Github Classroom portal to see if it passed successfully or failed. Once you pass the autograder with a score of 100, you have successfully completed the challenge.
- You can submit multiple times before the deadline. The last submission before the deadline will be considered your final submission.
- You will lose access to the repository after the deadline.

## Evaluation Criteria
Your submission will be evaluated based on:
- **Autograder**: Your code must pass the autograder [test script](./test/test.spec.ts).
- **Explainer Comments**: Include comments explaining each step of your code.
- **Code Quality**: Your code should be well-organized, commented, and adhere to best practices.

### Plagiarism Policy
Our plagiarism detection checker thoroughly identifies any instances of copying or cheating. Participants are required to publish their solutions in the designated repository, which is private and accessible only to the individual and the administrator. Solutions should not be shared publicly or with peers. In case of plagiarism, both parties involved will be directly disqualified to maintain fairness and integrity.

### AI Usage Disclaimer
You may use AI tools like ChatGPT to gather information and explore alternative approaches, but avoid relying solely on AI for complete solutions. Verify and validate any insights obtained and maintain a balance between AI assistance and independent problem-solving.

## Why These Restrictions?
These rules are designed to enhance your understanding of the technical aspects of Bitcoin. By completing this assignment, you gain practical experience with the technology that secures and maintains the trustlessness of Bitcoin. This challenge not only tests your ability to develop functional Bitcoin applications but also encourages deep engagement with the core elements of Bitcoin technology.