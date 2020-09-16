FROM ubuntu:bionic

RUN apt-get update && apt-get install -y curl software-properties-common

RUN add-apt-repository -y ppa:wireguard/wireguard

# Docs here https://launchpad.net/~mysteriumnetwork/+archive/ubuntu/node
RUN add-apt-repository -y ppa:mysteriumnetwork/node

RUN apt-get update && apt-get install -y ipset openvpn libcap2-bin jq 
RUN apt-get install -y wireguard wireguard-dkms tmux

RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections
RUN apt-get install resolvconf

RUN echo "debconf mysterium/accept_terms select true" | debconf-set-selections
#RUN echo debconf mysterium/accept_terms seen true | debconf-set-selections
RUN apt-get install -y myst

RUN usermod -a -G mysterium-node root
WORKDIR /root
COPY run.sh /root
COPY db /var/lib/mysterium-node/db
COPY keystore /var/lib/mysterium-node/keystore
COPY config.toml /etc/mysterium-node/config.toml

EXPOSE 4449 40000-50000

CMD ["bash","run.sh"]