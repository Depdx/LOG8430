# set script to executable
sudo find . -name *.sh -exec chmod +x {} \;

# install YCSB
rm -rf ycsb-${YCSB_VERSION}
curl -O --location https://github.com/brianfrankcooper/YCSB/releases/download/${YCSB_VERSION}/ycsb-${YCSB_VERSION}.tar.gz
tar -xvf ycsb-${YCSB_VERSION}.tar.gz
rm ycsb-${YCSB_VERSION}.tar.gz

#install python dependencies
pip install -r requirements.txt
