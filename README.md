# Learning Bitcoin from the Command Line - Week 1: Setting up and interacting with a Bitcoin Node

## Overview

In this first week you will:

1. **Set up** Bitcoin Core from scratch (Bash only).
2. **Interact** with the running node on `regtest` through RPC calls. You may write the interaction code in **Bash, Python, JavaScript (Node.js) _or_ Rust**.
3. **Output** a small report file named (`out.txt`) in the current directory, that demonstrates you can create wallets, send a transaction, and mine a confirming block.
4. **Target Locations** for the solution code for each languages are given below:
   1. Bash: [solution.sh](./bash/solution.sh)
   2. Javascript: [index.js](./javascript/index.js)
   3. Python: [main.py](./python/main.py)
   4. Rust: [main.rs](./rust/src/main.rs)

## Problem Statement

The starting steps of any automated node software (Umbrel, MyNode, Raspibltiz etc) is to download the bitcoin binaries, verify signatures, install them in correct locations, provide specific user access, and then start the node.
The node will then go into IBD (Initial Block Download) phase, where it will download and validate the whole blockchain. Once the IBD completes, it will initiate a wallet and then the user can start transacting Bitcoin with the node (via node UI, or connecting mobile wallets to the node).

The following exercise is the toy version of the same process via bash script.
We will not have to do IBD, because we will be using `regtest` where we can create our own toy blocks with toy transactions.

## Solution Requirements

You need to write a bash script that will do the following:

### Setup - Bash only

Write Bash code in [setup.sh](./setup.sh) that

- Download the latest Bitcoin Core binaries from Bitcoin Core Org https://bitcoincore.org/.
- Copy the downloaded binaries to `/usr/local/bin/` for folder.
- Create `~/.bitcoin/bitcoin.conf` (make the directory if needed) with:
  ```
  regtest=1
  fallbackfee=0.0001
  server=1
  rest=1
  txindex=1
  rpcauth=alice:88cae77e34048eff8b9f0be35527dd91$d5c4e7ff4dfe771808e9c00a1393b90d498f54dcab0ee74a2d77bd01230cd4cc
  ```
  Make sure that you escape the `$` sign in the `rpcauth` line.
- Start `bitcoind`.

### Node Interaction - Choose ONE Language

Implement the remaining tasks in exactly one of the language-specific directories: `bash`, `javascript`, `python`, or `rust`.

Your program must:

- Create two wallet named `Miner` and `Trader`. The names are case-sensitive and should be exact.
- Generate one address from the `Miner` wallet with a label "Mining Reward".
- Mine new blocks to this address until you get positive wallet balance. (use `generatetoaddress`) (observe how many blocks it took to get to a positive balance)
- Write a short comment describing why wallet balance for block rewards behaves that way.
- Print the balance of the `Miner` wallet.
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

## Local Testing

### Prerequisites

| Language       | Prerequisite packages       |
| -------------- |-----------------------------|
| **Bash**       | `jq`, `curl`, `wget`, `tar` |
| **JavaScript** | Node.js ≥ 20, `npm`         |
| **Python**     | Python ≥ 3.9                |
| **Rust**       | Rust stable toolchain       |


- Install `jq` tool for parsing JSON data if you don't have it installed.
- Install Node.js and npm to run the test script.
- Node version 20 or higher is recommended. You can install Node.js using the following command:
  ```
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
  source ~/.nvm/nvm.sh
  nvm install --lts
  ```
- Install the required npm packages by running `npm install`.

### Local Testing Steps
It's a good idea to r un the whole test locally to ensure your code is working properly.
- Uncomment the specific line in [run.sh](./run.sh) corresponding to your language of choice. 
- Grant execution permission to [test.sh](./test.sh), by running `chmod +x ./test.sh`.
- Execute `./test.sh`.
- The test script will run your script and verify the output. If the test script passes, you have successfully completed the challenge and are ready to submit your solution.

### Common Issues
- Your submission should not stop the Bitcoin Core daemon at any point.
- Make sure your `bitcoin.conf` file is correctly configured with the required parameters.
- Linux and MacOS are the recommended operating systems for this challenge. If you are using Windows, you may face compatibility issues.
- The autograder will run the test script on an Ubuntu 22.04 environment. Make sure your script is compatible with this environment.
- If you are unable to run the test script locally, you can submit your solution and check the results on the Github.


## Submission

- Commit all code inside the appropriate language directory and the modified `run.sh`.
  ```
  git add .
  git commit -m "Week 1 solution"
  ```
- Push to the main branch:
  ```
    git push origin main
  ```
- The autograder will run your script against a test script to verify the functionality.
- Check the status of the autograder on the Github Classroom portal to see if it passed successfully or failed. Once you pass the autograder with a score of 100, you have successfully completed the challenge.
- You can submit multiple times before the deadline. The latest submission before the deadline will be considered your final submission.
- You will lose access to the repository after the deadline.

## Evaluation Criteria

| Area                   | Weight      | Description                                                                                                                         |
| ---------------------- | ----------- |-------------------------------------------------------------------------------------------------------------------------------------|
| **Autograder**         | **Primary** | Your code must pass the autograder [test script](./test/test.spec.ts).                                                                              |
| **Explainer comments** | Required    | Include comments explaining each step of your code.                                                                                 |
| **Code quality**       | Required    | Your code should be well-organized, commented, and adhere to best practices like idiomatic style, meaningful names, error handling. |

### Plagiarism Policy
Our plagiarism detection checker thoroughly identifies any instances of copying or cheating. Participants are required to publish their solutions in the designated repository, which is private and accessible only to the individual and the administrator. Solutions should not be shared publicly or with peers. In case of plagiarism, both parties involved will be directly disqualified to maintain fairness and integrity.

### AI Usage Disclaimer
You may use AI tools like ChatGPT to gather information and explore alternative approaches, but avoid relying solely on AI for complete solutions. Verify and validate any insights obtained and maintain a balance between AI assistance and independent problem-solving.

## Why These Restrictions?
These rules are designed to enhance your understanding of the technical aspects of Bitcoin. By completing this assignment, you gain practical experience with the technology that secures and maintains the trustlessness of Bitcoin. This challenge not only tests your ability to develop functional Bitcoin applications but also encourages deep engagement with the core elements of Bitcoin technology.