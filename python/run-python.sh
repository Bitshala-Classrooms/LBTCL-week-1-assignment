#!/bin/bash

# Create a virtual environment if it doesn't exist
if [ ! -d "./venv" ]; then
    python3 -m venv venv
fi

# Activate the virtual environment
source ./venv/bin/activate

# Install required dependencies
pip install --upgrade pip
pip install python-bitcoinrpc

# Run the Python script
python3 ./python/main.py