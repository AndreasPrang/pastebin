#!/bin/bash

if [[ $EUID -eq 0 ]]; then
    echo "This script should not be run using sudo or as the root user"
    exit 1
fi

# BASIC INSTALLATION 
apt-get update
apt-get -y upgrade
curl -sL https://deb.nodesource.com/setup_4.x | bash -
apt-get install -y nodejs
apt-get install -y build-essential
apt-get install -y libavahi-compat-libdnssd-dev
apt-get install -y git
npm install -g homebridge

# INSTALL PLUGIN 'homebridge-gpio'
npm install -g homebridge-gpio
git clone git://github.com/jamesblanksby/quick2wire-gpio-admin.git
cd quick2wire-gpio-admin
make
make install
adduser $USER gpio

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
