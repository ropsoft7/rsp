#!/bin/bash

WRAPPER="`readlink -f "$0"`"
HERE="`dirname "$WRAPPER"`"

cd $HERE;

sudo ./privoxy/sbin/privoxy --no-daemon ./privoxy/etc/config

exit 0