#!/bin/sh

# Print the jwt to the dappmanager
JWT=$(cat ./jwtsecret.hex)
curl -X POST "http://my.dappnode/data-send?key=jwt&data=${JWT}"

PORT="${P2P_PORT:=30303}"

exec reth node \
    --http.addr=0.0.0.0 \
    --http.corsdomain=* \
    --ws \
    --metrics=0.0.0.0:6060 \
    --port=${P2P_PORT} \
    --authrpc.jwtsecret=${JWT_PATH} \
    --authrpc.addr 0.0.0.0 \
    ${EXTRA_OPTIONS}
