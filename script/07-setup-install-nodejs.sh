#!/bin/bash

echo "Installing npm..."

sudo apt install npm -y;

echo "Installing n..."

sudo npm install -g n;

echo "Installing Node.js 18 from n..."

sudo n 18;

echo "Removing non local node & npm binaries"

sudo apt remove nodejs npm -y;

echo "Installing global npm packages from npm..."

sudo npm install -g pm2;
sudo npm install -g shelljs;
sudo npm install -g inquirer;
sudo npm install -g typescript;

echo "Istalling @RSp npm global packages from github..."

sudo npm install https://github.com/ropsoft7/rsp-proman.git -g 
sudo npm install https://github.com/ropsoft7/rsp-projman.git -g 
sudo npm install https://github.com/ropsoft7/rsp-libjscript.git -g 

exit 0;