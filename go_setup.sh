#!/usr/bin/bash

cd /tmp
curl -O https://dl.google.com/go/go1.11.2.linux-amd64.tar.gz
tar -xzvf go1.11.2.linux-amd64.tar.gz
sudo mv go /usr/local/
cd /home/centos

export PATH=$PATH:/usr/local/go/bin

mkdir -p $HOME/go/{bin,src}

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
