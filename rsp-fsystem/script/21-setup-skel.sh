#!/bin/bash

WRAPPER="`readlink -f "$0"`"
HERE="`dirname "$WRAPPER"`"

cd $HERE;

echo Setting up /etc/skel

cd ..
cd src
cd etc.skel

echo Removing current /etc/skel

sudo mkdir -p /etc/skel

sudo rm -rf /etc/skel/*
sudo rm -rf /etc/skel/.*

echo Placing current /etc/skel

sudo cp -rf * /etc/skel/
sudo cp -rf .* /etc/skel/

exit 0;
