#!/bin/bash

cd /home/container || exit

echo -e "Preparing Config"
/usr/local/bin/envsubst  < /home/container/tes3mp-server-default.cfg.tpl > /home/container/tes3mp-server-default.cfg
echo -e "Done Preparing Config"

if test -f ./tes3mp-prelaunch; then bash ./tes3mp-prelaunch "$WRAPPER"; fi
LD_LIBRARY_PATH="./lib" exec ./tes3mp-server.x86_64