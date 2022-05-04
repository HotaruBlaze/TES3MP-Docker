#!/bin/bash

cd /home/container/TES3MP-server || exit

if test -f ./tes3mp-prelaunch; then bash ./tes3mp-prelaunch "$WRAPPER"; fi
LD_LIBRARY_PATH="./lib" exec ./tes3mp-server.x86_64