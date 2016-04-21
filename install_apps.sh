#!/usr/bin/env bash

#Tig - linux
curl http://jonas.nitro.dk/tig/releases/tig-2.1.1.tar.gz --output tig-2.1.1.tar.gz
tar -zxvf tig-2.1.1.tar.gz
sudo apt-get install libncurses-dev
./configure
make
sudo make install