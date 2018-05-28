# MIT License
# Copyright (c) 2017 Nicola Worthington <nicolaw@tfb.net>

FROM debian:stretch
LABEL author="Nicola Worthington <nicolaw@tfb.net>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq -o Dpkg::Use-Pty=0 update && \
    apt-get -qq -o Dpkg::Use-Pty=0 install -y --no-install-recommends \
    bc \
    clang \
    cmake \
    curl \
    g++ \
    gcc \
    git \
    make \
    zlib1g-dev \
    libbz2-dev \
 < /dev/null > /dev/null \
 && rm -rf /var/lib/apt/lists/*

COPY blip_0.10-1_all.deb /tmp/blip.deb
RUN dpkg -i /tmp/blip.deb && rm -f /tmp/blip.deb

WORKDIR /

COPY build.sh /
RUN chmod +x /build.sh

VOLUME /artifacts

ENV DEBIAN_FRONTEND newt

ENTRYPOINT ["/build.sh"]
CMD ["-o", "/artifacts"]

