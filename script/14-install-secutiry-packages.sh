#!/bin/bash

echo "Installing secutiry packages.."

sudo apt install -y ufw
sudo apt install -y fail2ban
sudo apt install -y selinux-policy-default

sudo systemctl enable ufw
sudo systemctl enable selinux*
sudo systemctl enable fail2ban

exit 0;