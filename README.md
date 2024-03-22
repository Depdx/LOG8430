# TP3 LOG8430 - Benchmark de performance

# MongoDB
## Start MongoDB
```bash
docker run --name mongodb1 -p 27017:27017 -d mongodb/mongodb-community-server:latest
```

## run workload mongoDB
```bash
cd ycsb-0.17.0
./bin/ycsb load mongodb-async -s -P workloads/workloada > outputLoad.txt
./bin/ycsb run mongodb-async -s -P workloads/workloada > outputRun.txt
```

# Redis
## Start Redis
```bash
docker run --name redis1 -p 6379:6379 -d redis
```

# run workload Redis
```bash
cd ycsb-0.17.0
./bin/ycsb load redis -s -P workloads/workloada -p "redis.host=127.0.0.1" -p "redis.port=6379" > outputLoad.txt
./bin/ycsb run redis -s -P workloads/workloada -p "redis.host=127.0.0.1" -p "redis.port=6379" > outputRun.txt
```
