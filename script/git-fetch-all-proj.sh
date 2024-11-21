#!/bin/bash

# Diretório onde o script "init" está localizado
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

    cd $SCRIPT_DIR
    cd ..;

echo Git sycinxing already fetch projects...

    bash script/git-sync-all.sh &&

echo Removing already fetched projects...

    rm -rf rsp-*

echo Fetching working projects

    git clone git@github.com:ropsoft7/rsp-arch.git
    git clone git@github.com:ropsoft7/rsp-asset.git
    git clone git@github.com:ropsoft7/rsp-remake.git
    git clone git@github.com:ropsoft7/rsp-fsystem.git

echo Fetching npm projects

    git clone git@github.com:ropsoft7/rsp-proman.git
    git clone git@github.com:ropsoft7/rsp-projman.git
    git clone git@github.com:ropsoft7/rsp-libjscript.git

exit 0