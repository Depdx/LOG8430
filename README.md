# TP3 LOG8430 - Performance Benchmark

# Installation
Need to open the devcontainer, everything takes place in that container


# MongoDB

## deployement


## run workload mongoDB
```bash
cd ycsb-0.17.0
./bin/ycsb load mongodb-async -s -P workloads/workloada > outputLoad.txt
./bin/ycsb run mongodb-async -s -P workloads/workloada > outputRun.txt
```

# Redis

## deployement

https://redis.io/docs/management/scaling/#create-a-redis-cluster

## Start Redis
```bash
docker run --name redis1 -p 6379:6379 -d redis
```

# run workload Redis
```bash
cd ycsb-0.17.0
./bin/ycsb load redis -s -P workloads/workloada -p "redis.host=127.0.0.1" -p "redis.port=7000" -p "redis.cluster=true" > ../outputLoad.txt
./bin/ycsb run redis -s -P workloads/workloada -p "redis.host=127.0.0.1" -p "redis.port=7000" -p "redis.cluster=true" > ../outputRun.txt
```
