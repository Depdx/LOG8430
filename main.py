import os

pwd = os.path.dirname(os.path.abspath(__file__))

# start the cluster
os.chdir(pwd + '/mongodb/1-nodes/')
os.system('./start_cluster.sh')

# load and run the YCSB benchmark
os.chdir(pwd + '/ycsb-0.17.0/')
os.system('./bin/ycsb load mongodb-async -s -P workloads/workloada > ../outputLoad.txt')
os.system('./bin/ycsb run mongodb-async -s -P workloads/workloada > ../outputRun.txt')

# stop the cluster
os.chdir(pwd + '/mongodb/1-nodes/')
os.system('docker compose down')
os.chdir(pwd)
