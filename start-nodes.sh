#!/bin/bash

# Settings
BIN_PATH="/usr/bin"
CLUSTER_HOST=$(ip addr | grep -E "inet .* brd" -m 1 | awk '{print $2}' | sed 's/\/.*//')
PORT=30000
TIMEOUT=2000
NODES=2
PROTECTED_MODE=no
ADDITIONAL_OPTIONS=""

ENDPORT=$((PORT+NODES))


while [ $((PORT < ENDPORT)) != "0" ]; do
    PORT=$((PORT+1))
    echo "Starting $PORT"
    $BIN_PATH/redis-server --port $PORT  --protected-mode $PROTECTED_MODE --cluster-enabled yes --cluster-config-file nodes-${PORT}.conf --cluster-node-timeout $TIMEOUT --appendonly yes --appendfilename appendonly-${PORT}.aof --dbfilename dump-${PORT}.rdb --logfile ${PORT}.log --daemonize yes ${ADDITIONAL_OPTIONS}
done
exit 0

