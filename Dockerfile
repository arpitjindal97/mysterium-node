FROM mysteriumnetwork/myst:latest

COPY db /var/lib/mysterium-node/mainnet/db
COPY keystore /var/lib/mysterium-node/keystore
COPY nodeui-pass /var/lib/mysterium-node/nodeui-pass
COPY config.toml /var/lib/mysterium-node/config-mainnet.toml

EXPOSE 4449
