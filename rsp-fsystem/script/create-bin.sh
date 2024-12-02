#!/bin/bash

WRAPPER="`readlink -f "$0"`"
HERE="`dirname "$WRAPPER"`"

cd $HERE;

if [ -z "$1" ]; then
    echo "Usage: npm run create <script_name>"
    return 1
fi

cd ..;

SCRIPT=$1;
SCRIPT_DIST="/usr/local/bin"

nano ./src/usr.bin/rsp.$SCRIPT;
chmod +x ./src/usr.bin/rsp.$SCRIPT
sudo cp -rf ./src/usr.bin/rsp.$SCRIPT $SCRIPT_DIST;

exit 0;
