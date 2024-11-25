#!/bin/bash

pm2 stop psiphon-client
pm2 del psiphon-client
pm2 start "./psiphon3-linux-client/psiphon-tunnel-core-x86_64 -config ./psiphon3-linux-client/psi-client.conf" --max-memory-restart 45M --namespace network --name psiphon-client

exit 0