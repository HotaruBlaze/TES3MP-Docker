[General]
# The default localAddress of 0.0.0.0 makes the server reachable at all of its local addresses
# You almost never have to change this
localAddress = ${LOCAL_IP}
port = ${SERVER_PORT}
maximumPlayers = ${MAX_PLAYERS}
hostname = ${SERVER_NAME}
# 0 - Verbose (spam), 1 - Info, 2 - Warnings, 3 - Errors, 4 - Only fatal errors
logLevel = 1
password = ${SERVER_PASSSWORD}

[Plugins]
home = ./server
plugins = serverCore.lua

[MasterServer]
enabled = ${ENABLE_MASTERSERVER}
address = master.tes3mp.com
port = 25561
rate = 10000
