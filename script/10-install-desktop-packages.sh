#!/bin/bash

echo "Installing desktop packages...";

sudo apt install -y qt6-*
sudo apt install -y libqt6*
sudo apt install -y libxcb*
sudo apt install -y libx11*
sudo apt install -y libgl1-mesa-glx
sudo apt install -y libgl1-mesa-dri
sudo apt install -y xdg-desktop-portal-wlr
sudo apt install -y libgl1-nvidia-tesla-470-glvnd-glx
sudo apt install -y libxkb*
sudo apt install -y libwayland*
sudo apt install -y libinput*
sudo apt install -y libkf6con*
sudo apt install -y kf5-messagelib-data
sudo apt install -y kf6-breeze-icon-theme*
sudo apt install -y breeze*
sudo apt install -y wayland*
sudo apt install -y xcb*
sudo apt install -y xkb*
sudo apt install -y wayland*
sudo apt install -y libwlroots*
sudo apt install -y xwayland
sudo apt install -y xwayland-run

exit 0;