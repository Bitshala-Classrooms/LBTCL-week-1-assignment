# Setup nvm and install pre-req
if command -v node > /dev/null 2>&1; then
  echo "Node.js is already installed. Current version: $(node -v)"
else
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  nvm install --lts
fi
npm install

set -e  # Exit immediately if any command fails

# Start the setup script and give access to all runners
chmod +x setup.sh
/bin/bash setup.sh

chmod +x ./bash/run-bash.sh
chmod +x ./python/run-python.sh
chmod +x ./javascript/run-javascript.sh
chmod +x ./rust/run-rust.sh
chmod +x ./run.sh

# Run the test scripts
/bin/bash run.sh
npm run test

# Stop the bitcoind
if pgrep -x "bitcoind" > /dev/null; then
  echo "Stopping bitcoind..."
  pkill -x "bitcoind"
  echo "bitcoind stopped."
else
  echo "bitcoind is not running."
fi