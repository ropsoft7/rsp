#!/bin/bash

# Caminho do diretório onde este script está localizado
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

cd $SCRIPT_DIR;

bash ./git-fetch-all.sh;

cd ..;

cd ./rsp-fsystem

cd script

bash init.sh;

cd $SCRIPT_DIR;

echo $SCRIPT_DIR;

sleep 3

exit 0;