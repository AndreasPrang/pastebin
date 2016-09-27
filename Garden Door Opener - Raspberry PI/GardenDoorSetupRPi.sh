#!/bin/bash

# BASIC INSTALLATION 
sudo apt-get update
sudo apt-get -y upgrade
curl -sL https://deb.nodesource.com/setup_4.x | bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential
sudo apt-get install -y libavahi-compat-libdnssd-dev
sudo apt-get install -y git
sudo npm install -g homebridge
# sudo npm install -g rpi-gpio

# INSTALL PLUGIN 'homebridge-gpio'
sudo npm install -g homebridge-gpio
git clone git://github.com/jamesblanksby/quick2wire-gpio-admin.git
cd quick2wire-gpio-admin
make
sudo make install
sudo adduser $USER gpio

# CREATE CONFIG FILE 
mkdir -p ~/.homebridge
nano ~/.homebridge/config.json


curl -sL -o ~/.homebridge/config.json https://raw.githubusercontent.com/AndreasPrang/pastebin/master/Garden%20Door%20Opener%20-%20Raspberry%20PI/config.json

curl -sL -o /etc/init.d/homebridge https://raw.githubusercontent.com/AndreasPrang/pastebin/master/Garden%20Door%20Opener%20-%20Raspberry%20PI/homebridge | echo > /etc/init.d/homebridge
chmod 755 /etc/init.d/homebridge
update-rc.d homebridge defaults
service homebridge start
