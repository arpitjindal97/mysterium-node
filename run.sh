#!/bin/bash

chmod 666 /dev/net/tun

if [ -n "$SERVER" ];
then
    echo "$USER : EAP \"$PASS\""  > /etc/ipsec.secrets​
    sed -i "s/USER/$USER/g" /etc/ipsec.conf
    sed -i "s/SERVER/$SERVER/g" /etc/ipsec.conf
    ipsec start
else
    echo $USER > /vpn/pass.txt
    echo $PASS >> /vpn/pass.txt
    openvpn --config /vpn/ovpn-config/$FILE --auth-user-pass /vpn/pass.txt --daemon
fi
sleep 10

/usr/local/bin/docker-entrypoint.sh service --agreed-terms-and-conditions
