#!/bin/bash

export REDIS_NODE_0_ADRESS=$(ping redis_node_0 -c 1 | head -n 1 | cut -d "(" -f 2 | cut -d ")" -f 1)
export REDIS_NODE_O=${REDIS_NODE_0_ADRESS}:${REDIS_NODE_0_PORT}
echo "REDIS_NODE_O: ${REDIS_NODE_O}"

export REDIS_NODE_1_ADRESS=$(ping redis_node_1 -c 1 | head -n 1 | cut -d "(" -f 2 | cut -d ")" -f 1)
export REDIS_NODE_1=${REDIS_NODE_1_ADRESS}:${REDIS_NODE_1_PORT}
echo "REDIS_NODE_1: ${REDIS_NODE_1}"

export REDIS_NODE_2_ADRESS=$(ping redis_node_2 -c 1 | head -n 1 | cut -d "(" -f 2 | cut -d ")" -f 1)
export REDIS_NODE_2=${REDIS_NODE_2_ADRESS}:${REDIS_NODE_2_PORT}
echo "REDIS_NODE_2: ${REDIS_NODE_2}"

export REDIS_NODE_3_ADRESS=$(ping redis_node_3 -c 1 | head -n 1 | cut -d "(" -f 2 | cut -d ")" -f 1)
export REDIS_NODE_3=${REDIS_NODE_3_ADRESS}:${REDIS_NODE_3_PORT}
echo "REDIS_NODE_3: ${REDIS_NODE_3}"

export REDIS_NODE_4_ADRESS=$(ping redis_node_4 -c 1 | head -n 1 | cut -d "(" -f 2 | cut -d ")" -f 1)
export REDIS_NODE_4=${REDIS_NODE_4_ADRESS}:${REDIS_NODE_4_PORT}
echo "REDIS_NODE_4: ${REDIS_NODE_4}"

redis-cli --cluster create --cluster-yes ${REDIS_NODE_O} ${REDIS_NODE_1} ${REDIS_NODE_2} ${REDIS_NODE_3} ${REDIS_NODE_4}
