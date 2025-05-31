# #!/usr/bin/env bash
# ###############################################################################
# # Bitcoin Core installation – scaffold with explainer comments
# #
# # Your task: replace each comment with the appropriate Bash command(s) so the script
# # (1) downloads Bitcoin Core 27.1,
# # (2) installs the binaries system-wide,
# # (3) creates a regtest-ready configuration
# # (4) launches the daemon.
# #
# # TIP: keep the overall order exactly as shown; every step depends on the one
# # before it.
# ###############################################################################

# echo "Installing Bitcoin Core .... "

# # 2) Create a temporary working directory called “install” that will hold the
# #    downloaded archive. If the directory already exists, the command shouldn’t
# #    fail.
# mkdir -p install

# # 3) Move into that “install” directory so subsequent commands run there.
# cd install

# # 4) Download the official Bitcoin Core 27.1 Linux tarball:
# #      https://bitcoincore.org/bin/bitcoin-core-27.1/bitcoin-27.1-x86_64-linux-gnu.tar.gz
# #    Requirements/hints:
# #      • Use wget (or curl –O) to fetch the file.
# #      • Redirect both stdout and stderr to /dev/null so the terminal stays
# #        quiet ( > /dev/null 2>&1 ).
# wget https://bitcoincore.org/bin/bitcoin-core-27.1/bitcoin-27.1-x86_64-linux-gnu.tar.gz > /dev/null 2>&1

# # 5) Extract the tarball in place. You only need the –f flag because the archive
# #    name is provided explicitly.
# tar -xf bitcoin-27.1-x86_64-linux-gnu.tar.gz

# # 6) Copy **all** executables from the extracted directory’s bin/ sub-folder to
# #    /usr/local/bin so they land on the system’s PATH.
# #    (You’ll need sudo if you aren’t already root.)
# sudo cp bitcoin-27.1/bin/* /usr/local/bin/

# 7) Make sure the Bitcoin data/config directory exists in your home folder
#    (~/.bitcoin). Use –p so the command succeeds even if the path is already
#    there.
mkdir -p ~/.bitcoin

# 8) Append the following regtest-focused settings to ~/.bitcoin/bitcoin.conf.
#    You can use a single redirected echo. Preserve line
#    breaks exactly:
#
#      regtest=1
#      fallbackfee=0.0001
#      server=1
#      rest=1
#      txindex=1
#      rpcauth=alice:88cae77e34048eff8b9f0be35527dd91\$d5c4e7ff4dfe771808e9c00a1393b90d498f54dcab0ee74a2d77bd01230cd4cc
if [ ! -f ~/.bitcoin/bitcoin.conf ]; then
    cat <<EOL >> ~/.bitcoin/bitcoin.conf
regtest=1
fallbackfee=0.0001
server=1
rest=1
txindex=1
rpcauth=alice:88cae77e34048eff8b9f0be35527dd91\$d5c4e7ff4dfe771808e9c00a1393b90d498f54dcab0ee74a2d77bd01230cd4cc
EOL
fi

# 9) Return to whichever directory you were in before entering “install”.
#    (Hint: a simple cd .. does the trick.)
cd ..

# 10) Launch the Bitcoin daemon (bitcoind) in the background so the shell prompt
#     returns immediately. Use the flag that tells bitcoind to detach and run as
#     a background process.
bitcoind -daemon

# All done!
sleep 5
echo "Bitcoin Core installation complete. The node is running in regtest mode."
