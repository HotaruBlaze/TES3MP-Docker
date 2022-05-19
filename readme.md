## TES3MP Personal Alternative Docker Image.

### Enviroment Variables with Defaults
```
SERVER_NAME = My TES3MP Server
LOCAL_IP = 0.0.0.0
SERVER_PORT = 25565
MAX_PLAYERS = 64
ENABLE_MASTERSERVER = true
SERVER_PASSSWORD = ""
```

#### To use: 
`docker pull ghcr.io/hotarublaze/tes3mp-docker:0.8.1`


#### To Build:
`docker build --build-arg TES3MP_VERSION=0.8.1 -t tes3mp-docker:0.8.1 .`