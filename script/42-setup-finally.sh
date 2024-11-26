#!/bin/bash

echo "Updating & upgrading packages"

sudo apt update && sudo apt-get upgrade -y;

echo "Removing & purging non-needed packages"

sudo apt autoremove --purge -y;

exit 0;