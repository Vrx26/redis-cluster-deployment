#!/bin/bash

# Settings
BIN_PATH="/usr/bin"
CLUSTER_HOST=192.168.15.7
PORT=30000
TIMEOUT=2000
NODES=2
PROTECTED_MODE=no
ADDITIONAL_OPTIONS=""

ENDPORT=$((PORT+NODES))

if [ "$1" == "start" ]
then
    while [ $((PORT < ENDPORT)) != "0" ]; do
        PORT=$((PORT+1))
        echo "Starting $PORT"
        mkdir "node-$PORT"
        $BIN_PATH/redis-server --port $PORT  --protected-mode $PROTECTED_MODE --cluster-enabled yes --cluster-config-file node-$PORT/nodes-${PORT}.conf --cluster-node-timeout $TIMEOUT --appendonly yes --appendfilename node-$PORT/appendonly-${PORT}.aof --dbfilename node-$PORT/dump-${PORT}.rdb --logfile node-$PORT/${PORT}.log --daemonize yes ${ADDITIONAL_OPTIONS}
    done
    exit 0
fi
