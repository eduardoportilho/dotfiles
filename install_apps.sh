#!/usr/bin/env bash

if [ -d "~/dot-tmp" ]; then
    mkdir ~/dot-tmp
fi
cd ~/dot-tmp

# Fish
sudo apt-get install software-properties-common python-software-properties -y
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get install fish=2.2.0-1~trusty
if [ -d "~/.config/fish/" ]; then
    mkdir -p ~/.config/fish/
fi
sudo chmod -R a+rw /home/eduardoportilho/.config/fish

echo "# Change shell to fish" >> ~/.profile
echo "if [ \"$SHELL\" != \"/usr/bin/fish\" ]" >> ~/.profile
echo "then" >> ~/.profile
echo "    export SHELL=\"/usr/bin/fish\"" >> ~/.profile
echo "    exec /usr/bin/fish -l    # -l: run as a login shell" >> ~/.profile
echo "fi" >> ~/.profile


#Tig - linux
sudo apt-get install libncurses-dev -y
curl http://jonas.nitro.dk/tig/releases/tig-2.1.1.tar.gz --output tig-2.1.1.tar.gz
tar -zxvf tig-2.1.1.tar.gz
./configure
make
sudo make install