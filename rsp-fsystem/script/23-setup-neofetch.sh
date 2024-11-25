#!/bin/bash

WRAPPER="`readlink -f "$0"`"
HERE="`dirname "$WRAPPER"`"

cd $HERE;

echo Setting up /efi/skel

cd ..
cd src
cd etc.neofetch

echo Removing current /etc.neofetch

sudo rm -rf /etc.neofetch

sudo mkdir -p /etc.neofetch

echo Placing current /efi/skel

sudo cp -rf * /etc.neofetch

exit 0;