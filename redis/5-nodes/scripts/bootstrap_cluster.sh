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

export REDIS_REPLICA_NODE_0_0=$(ping redis_replica_node_0_0 -c 1 | head -n 1 | cut -d "(" -f 2 | cut -d ")" -f 1)
export REDIS_REPLICA_NODE_0_0=${REDIS_REPLICA_NODE_0_0}:${REDIS_REPLICA_NODE_0_0_PORT}
echo "REDIS_REPLICA_NODE_0_0: ${REDIS_REPLICA_NODE_0_0}"

export REDIS_REPLICA_NODE_0_1=$(ping redis_replica_node_0_1 -c 1 | head -n 1 | cut -d "(" -f 2 | cut -d ")" -f 1)
export REDIS_REPLICA_NODE_0_1=${REDIS_REPLICA_NODE_0_1}:${REDIS_REPLICA_NODE_0_1_PORT}
echo "REDIS_REPLICA_NODE_0_1: ${REDIS_REPLICA_NODE_0_1}"

export REDIS_REPLICA_NODE_1_0=$(ping redis_replica_node_1_0 -c 1 | head -n 1 | cut -d "(" -f 2 | cut -d ")" -f 1)
export REDIS_REPLICA_NODE_1_0=${REDIS_REPLICA_NODE_1_0}:${REDIS_REPLICA_NODE_1_0_PORT}
echo "REDIS_REPLICA_NODE_1_0: ${REDIS_REPLICA_NODE_1_0}"

export REDIS_REPLICA_NODE_1_1=$(ping redis_replica_node_1_1 -c 1 | head -n 1 | cut -d "(" -f 2 | cut -d ")" -f 1)
export REDIS_REPLICA_NODE_1_1=${REDIS_REPLICA_NODE_1_1}:${REDIS_REPLICA_NODE_1_1_PORT}
echo "REDIS_REPLICA_NODE_1_1: ${REDIS_REPLICA_NODE_1_1}"

export REDIS_REPLICA_NODE_2_0=$(ping redis_replica_node_2_0 -c 1 | head -n 1 | cut -d "(" -f 2 | cut -d ")" -f 1)
export REDIS_REPLICA_NODE_2_0=${REDIS_REPLICA_NODE_2_0}:${REDIS_REPLICA_NODE_2_0_PORT}
echo "REDIS_REPLICA_NODE_2_0: ${REDIS_REPLICA_NODE_2_0}"

export REDIS_REPLICA_NODE_2_1=$(ping redis_replica_node_2_1 -c 1 | head -n 1 | cut -d "(" -f 2 | cut -d ")" -f 1)
export REDIS_REPLICA_NODE_2_1=${REDIS_REPLICA_NODE_2_1}:${REDIS_REPLICA_NODE_2_1_PORT}
echo "REDIS_REPLICA_NODE_2_1: ${REDIS_REPLICA_NODE_2_1}"

export REDIS_REPLICA_NODE_3_0=$(ping redis_replica_node_3_0 -c 1 | head -n 1 | cut -d "(" -f 2 | cut -d ")" -f 1)
export REDIS_REPLICA_NODE_3_0=${REDIS_REPLICA_NODE_3_0}:${REDIS_REPLICA_NODE_3_0_PORT}
echo "REDIS_REPLICA_NODE_3_0: ${REDIS_REPLICA_NODE_3_0}"

export REDIS_REPLICA_NODE_3_1=$(ping redis_replica_node_3_1 -c 1 | head -n 1 | cut -d "(" -f 2 | cut -d ")" -f 1)
export REDIS_REPLICA_NODE_3_1=${REDIS_REPLICA_NODE_3_1}:${REDIS_REPLICA_NODE_3_1_PORT}
echo "REDIS_REPLICA_NODE_3_1: ${REDIS_REPLICA_NODE_3_1}"

export REDIS_REPLICA_NODE_4_0=$(ping redis_replica_node_4_0 -c 1 | head -n 1 | cut -d "(" -f 2 | cut -d ")" -f 1)
export REDIS_REPLICA_NODE_4_0=${REDIS_REPLICA_NODE_4_0}:${REDIS_REPLICA_NODE_4_0_PORT}
echo "REDIS_REPLICA_NODE_4_0: ${REDIS_REPLICA_NODE_4_0}"

export REDIS_REPLICA_NODE_4_1=$(ping redis_replica_node_4_1 -c 1 | head -n 1 | cut -d "(" -f 2 | cut -d ")" -f 1)
export REDIS_REPLICA_NODE_4_1=${REDIS_REPLICA_NODE_4_1}:${REDIS_REPLICA_NODE_4_1_PORT}
echo "REDIS_REPLICA_NODE_4_1: ${REDIS_REPLICA_NODE_4_1}"

redis-cli --cluster create --cluster-yes \
    ${REDIS_NODE_O} \
    ${REDIS_NODE_1} \
    ${REDIS_NODE_2} \
    ${REDIS_NODE_3} \
    ${REDIS_NODE_4} \
    ${REDIS_REPLICA_NODE_0_0} \
    ${REDIS_REPLICA_NODE_0_1} \
    ${REDIS_REPLICA_NODE_1_0} \
    ${REDIS_REPLICA_NODE_1_1} \
    ${REDIS_REPLICA_NODE_2_0} \
    ${REDIS_REPLICA_NODE_2_1} \
    ${REDIS_REPLICA_NODE_3_0} \
    ${REDIS_REPLICA_NODE_3_1} \
    ${REDIS_REPLICA_NODE_4_0} \
    ${REDIS_REPLICA_NODE_4_1} \
    --cluster-replicas 2
