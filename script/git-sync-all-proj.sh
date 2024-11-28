#!/bin/bash

# Diretório onde o script "init" está localizado
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

cd $SCRIPT_DIR

cd ..;

echo "Git syncying status of all RSP projects in root project directory"

cd rsp-arch

git add .
git commit -m save
git push origin main

cd ..;

cd rsp-asset

git add .
git commit -m save
git push origin main

cd ..;

cd rsp-remake

git add .
git commit -m save
git push origin main
cd ..;

cd rsp-isolinux

git add .
git commit -m save
git push origin main
cd ..;

cd rsp-proman

git add .
git commit -m save
git push origin main
cd ..;

cd rsp-projman

git add .
git commit -m save
git push origin main
cd ..;

cd rsp-fsystem

git add .
git commit -m save
git push origin main
cd ..;

cd rsp-libjscript

git add .
git commit -m save
git push origin main
cd ..;

cd rsp-vspaces

git add .
git commit -m save
git push origin main
cd ..;

# Root dir
git add .
git commit -m save
git push origin main

exit 0;