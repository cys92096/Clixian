#!/bin/bash
cd
curl -LO https://github.com/alist-org/alist/releases/download/v3.38.0/alist-linux-amd64.tar.gz
tar -xvf alist-linux-amd64.tar.gz
chmod +x ./alist
mkdir .aria2
cd .aria2
wget https://github.com/P3TERX/aria2.conf/archive/refs/heads/master.tar.gz
tar -zxvf master.tar.gz --strip-components=1
rm -rf master.tar.gz
sed -i 's|rpc-secret|#rpc-secret|g' ./aria2.conf
touch aria2.session
./tracker.sh
cd
aria2c --enable-rpc -D
./alist server
