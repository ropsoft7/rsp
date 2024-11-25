#!/bin/bash

WRAPPER="`readlink -f "$0"`"
HERE="`dirname "$WRAPPER"`"

cd $HERE;

echo 1. Setting bins...

cd ..
cd src
cd usr.bin

sudo rm -rf /usr/local/bin/rsp.*
sudo cp -rf ./* /usr/local/bin

echo 2. Setting sbins...

cd ..
cd usr.sbin

sudo rm -rf /usr/local/sbin/rsp.*
sudo cp -rf ./* /usr/local/sbin

exit 0;