#!/bin/bash

source /etc/default/mysterium-node
/usr/bin/myst $CONF_DIR $SCRIPT_DIR $DATA_DIR $RUN_DIR $DAEMON_OPTS service --openvpn.port 1194 --agreed-terms-and-conditions $SERVICE_OPTS
