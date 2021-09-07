FROM mysteriumnetwork/myst:latest

COPY db /var/lib/mysterium-node/testnet3/db
COPY keystore /var/lib/mysterium-node/keystore
COPY nodeui-pass /var/lib/mysterium-node/nodeui-pass
COPY config.toml /etc/mysterium-node/config.toml

EXPOSE 4449
