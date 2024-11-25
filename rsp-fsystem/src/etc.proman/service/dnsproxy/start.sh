#!/bin/bash

WRAPPER="`readlink -f "$0"`"
HERE="`dirname "$WRAPPER"`"

cd $HERE;
 
FLAG="-u tls://1.1.1.1:853 -u tls://8.8.8.8:853 -u tls://8.8.4.4:853 --https-port 443 --quic-port 8853 -l 127.0.0.1 --tls-port 853 --timeout 15s"

sudo ./dnsproxy $FLAG

exit 0;