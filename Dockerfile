FROM ubuntu:bionic

LABEL Author="HotaruBlaze <https://github.com/HotaruBlaze>"
ENV USER=container HOME=/home/container
ENV TES3MP_VERSION=0.8.1

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

USER ${USER}

WORKDIR ${HOME}

RUN curl -O -J -L $(curl -sL https://api.github.com/repos/TES3MP/openmw-tes3mp/releases/tags/tes3mp-${TES3MP_VERSION} | jq -r ".assets[] | select(.name | contains(\"tes3mp-server-GNU+Linux-x86_64\")) | .browser_download_url") \
    && tar -xzvf *.tar.gz \
    && rm -rf *.tar.gz

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/bash", "/entrypoint.sh", "--", "./tes3mp-server" ]