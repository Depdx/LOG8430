# install YCSB
rm -rf ycsb-${YCSB_VERSION}
curl -O --location https://github.com/brianfrankcooper/YCSB/releases/download/${YCSB_VERSION}/ycsb-${YCSB_VERSION}.tar.gz
tar -xvf ycsb-${YCSB_VERSION}.tar.gz
rm ycsb-${YCSB_VERSION}.tar.gz

# pull database images
docker pull mongodb/mongodb-community-server:latest
docker pull redis:latest
