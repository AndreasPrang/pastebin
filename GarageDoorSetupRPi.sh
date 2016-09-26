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

 '~/.homebridge/config.json' SHOULD CONTAIN: 
echo '
{
    "bridge": {
        "name": "Homebridge",
        "username": "CC:22:3D:E3:CE:30",
        "port": 51826,
        "pin": "031-45-154"
    },

    "description": "Config file for HomeBridge-GPIO",

    "accessories": [
        {
                "accessory": "GPIO",
                "name": "GPIO4",
                "pin": 7,
                "duration": 4000
        }
    ],

    "platforms": [
    ]
}
' > ~/.homebridge/config.json