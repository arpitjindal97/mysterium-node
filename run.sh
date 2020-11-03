#!/bin/bash

chmod 666 /dev/net/tun

echo $USER > /vpn/pass.txt
echo $PASS >> /vpn/pass.txt

openvpn --config /vpn/ovpn-config/$FILE --auth-user-pass /vpn/pass.txt &

sleep 10

/usr/local/bin/docker-entrypoint.sh service --agreed-terms-and-conditions

