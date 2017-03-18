#!/bin/sh

set -e

export NODE_ID=${NODE_ID:-$(uuidgen | tr '[A-Z]' '[a-z]')}

export JVM_MIN_HEAP_SIZE=${JVM_MIN_HEAP_SIZE:-512M}
export JVM_MAX_HEAP_SIZE=${JVM_MAX_HEAP_SIZE:-1024M}
export JVM_HEAP_REGION_SIZE=${JVM_HEAP_REGION_SIZE:-32M}

export MAX_MEMORY=${MAX_MEMORY:-${JVM_MIN_HEAP_SIZE}B}
export MAX_MEMORY_PER_NODE=${MAX_MEMORY_PER_NODE:-${JVM_MIN_HEAP_SIZE}B}
export DISCOVERY_URI=${DISCOVERY_URI:-http://localhost:8080}

export LOG_LEVEL=${LOG_LEVEL:-INFO}

if [ ! -f /opt/presto/etc/node.properties ]; then
    . /opt/gen_config/node
fi

if [ ! -f /opt/presto/etc/log.properties ]; then
    . /opt/gen_config/log
fi

if [ ! -f /opt/presto/etc/jvm.config ]; then
    . /opt/gen_config/jvm
fi

if [ ! -f /opt/presto/etc/config.properties ]; then
    if [ "${NODE_TYPE}" = "worker" ]; then
	. /opt/gen_config/worker
    elif [ "${NODE_TYPE}" = "coordinator" ]; then
	. /opt/gen_config/coordinator
    else
	. /opt/gen_config/standalone
    fi
fi

exec "$@"
