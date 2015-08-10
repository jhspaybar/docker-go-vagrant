#!/usr/bin/env bash

apt-get update
apt-get install -y git CMake llvm build-essential clang-3.5 python2.7-dev

# Install Go
wget https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz -P /tmp
tar -C /usr/local -xzf /tmp/go1.4.2.linux-amd64.tar.gz
