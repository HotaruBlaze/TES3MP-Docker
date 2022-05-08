FROM ubuntu:bionic

LABEL Author="HotaruBlaze <https://github.com/HotaruBlaze>"
LABEL org.opencontainers.image.source = "https://github.com/HotaruBlaze/TES3MP-Docker"
ENV USER=container HOME=/home/container
ARG TES3MP_VERSION

ENV SERVER_NAME = My TES3MP Server
ENV SERVER_PORT = 25565
ENV MAX_PLAYERS = 64
ENV ENABLE_MASTERSERVER = true
ENV SERVER_PASSSWORD

RUN apt-get update && \
    apt-get install -y -qq \
    curl \
    libgl1-mesa-glx \
    libluajit-5.1-2 \
    libssl1.1 \
    curl \
    jq \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN useradd -u 500 -ms /bin/bash ${USER} \
    && chown ${USER}:nogroup ${HOME} \
    && cd ${HOME}
RUN curl -L https://github.com/a8m/envsubst/releases/download/v1.2.0/envsubst-`uname -s`-`uname -m` -o /usr/local/bin/envsubst \
    && chmod +x /usr/local/bin/envsubst 

USER ${USER}

WORKDIR ${HOME}

RUN curl -O -J -L $(curl -sL https://api.github.com/repos/TES3MP/openmw-tes3mp/releases/tags/tes3mp-${TES3MP_VERSION} | jq -r ".assets[] | select(.name | contains(\"tes3mp-server-GNU+Linux-x86_64\")) | .browser_download_url") \
    && tar -xzvf *.tar.gz \
    && rm -rf *.tar.gz \
    && mv TES3MP-server/* ${HOME} \
    && rm -rf TES3MP-server

COPY ./entrypoint.sh /entrypoint.sh
COPY tes3mp-server-default.cfg.tpl /home/container/tes3mp-server-default.cfg.tpl

ENTRYPOINT ["/bin/bash", "/entrypoint.sh", "--", "./tes3mp-server" ]