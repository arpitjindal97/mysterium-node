FROM mysteriumnetwork/myst:latest

COPY db /var/lib/mysterium-node/db
COPY keystore /var/lib/mysterium-node/keystore
COPY config.toml /etc/mysterium-node/config.toml

EXPOSE 4449
