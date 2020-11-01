#!/bin/bash

chmod 666 /dev/net/tun

echo $NORD_USER > /nord/pass.txt
echo $NORD_PASS >> /nord/pass.txt

openvpn --config /nord/ovpn_udp/$NORD_SERVER.udp.ovpn --auth-user-pass /nord/pass.txt &

sleep 10

/usr/local/bin/docker-entrypoint.sh service --agreed-terms-and-conditions

