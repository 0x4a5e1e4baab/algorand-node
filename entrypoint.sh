#!/bin/bash
ALGORAND_NETWORK=mainnet

if [[ -z $NETWORK ]]; then
  ALGORAND_NETWORK=mainnet
else
  ALGORAND_NETWORK=$NETWORK
fi
if [ "$ALGORAND_NETWORK" != devnet -a "$ALGORAND_NETWORK" != mainnet -a "$ALGORAND_NETWORK" != testnet ]; then
    echo "'$ALGORAND_NETWORK' is not a valid network"
    exit 1
fi
cp node/genesisfiles/$ALGORAND_NETWORK/genesis.json node/data
./update.sh -u -c stable -p node -d node/data -n && /algorand/node/algod -l 0.0.0.0:8080 -d /algorand/node/data
