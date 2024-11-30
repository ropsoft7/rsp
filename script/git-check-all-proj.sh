#!/bin/bash

# Diretório onde o script "init" está localizado
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

cd $SCRIPT_DIR

cd ..;

echo "Git showing status of all RSP projects in root project directory"

cd rsp-arch
pwd && git status;
cd ..;

cd rsp-asset
pwd && git status;
cd ..;

cd rsp-isolinux
pwd && git status;
cd ..;

cd rsp-remake
pwd && git status;
cd ..;

cd rsp-proman
pwd && git status;
cd ..;

cd rsp-projman
pwd && git status;
cd ..;

cd rsp-fsystem
pwd && git status;
cd ..;

cd rsp-libjscript
pwd && git status;
cd ..;

cd rsp-vspaces
pwd && git status;
cd ..;

# Root dir
pwd && git status;

exit 0;