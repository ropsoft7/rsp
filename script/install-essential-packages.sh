#!/bin/bash

echo "Updating and upgrading apt"

sudo apt update -y; 
sudo apt upgrade -y;

echo "Installing essential packages.."

sudo apt install -y adb
sudo apt install -y meson
sudo apt install -y gedit
sudo apt install -y cmake
sudo apt install -y redshift
sudo apt install -y net-tools
sudo apt install -y firefox-esr
sudo apt install -y cmake-extras
sudo apt install -y brightnessctl 
sudo apt install -y build-essential 
sudo apt install -y libasound2-plugins

exit 0;