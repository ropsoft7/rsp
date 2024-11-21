#!/bin/bash

echo "Installing firmware packages.."

sudo apt install -y firmware-linux*
sudo apt install -y linux-firewire-utils
sudo apt install -y firmware-intel-sound 
sudo apt install -y firmware-amd-graphics

exit 0