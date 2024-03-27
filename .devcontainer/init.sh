# install YCSB
rm -rf ycsb-${YCSB_VERSION}
curl -O --location https://github.com/brianfrankcooper/YCSB/releases/download/${YCSB_VERSION}/ycsb-${YCSB_VERSION}.tar.gz
tar -xvf ycsb-${YCSB_VERSION}.tar.gz
rm ycsb-${YCSB_VERSION}.tar.gz

# set script to executable
chmod +x /workspaces/LOG8430/mongodb/start_cluster.sh
chmod +x /workspaces/LOG8430/redis/start_cluster.sh
