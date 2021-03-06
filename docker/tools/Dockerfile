# MIT License
# Copyright (c) 2017 Nicola Worthington <nicolaw@tfb.net>

FROM debian:stretch
LABEL author="Nicola Worthington <nicolaw@tfb.net>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq -o Dpkg::Use-Pty=0 update && \
    apt-get -qq -o Dpkg::Use-Pty=0 install -y --no-install-recommends \
    bc \
    curl \
    libboost-filesystem1.62.0 \
    libboost-iostreams1.62.0 \
    libboost-program-options1.62.0 \
    libboost-system1.62.0 \
    libboost-thread1.62.0 \
    libboost-regex1.62.0 \
    libssl1.1 \
    libmariadbclient18 \
 < /dev/null > /dev/null \
 && rm -rf /var/lib/apt/lists/*

COPY blip_0.10-1_all.deb /tmp/blip.deb
RUN dpkg -i /tmp/blip.deb && rm -f /tmp/blip.deb

ENV install_prefix /opt/trinitycore
ENV PATH "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:${install_prefix}/bin"

WORKDIR "${install_prefix}/bin"

COPY tools.sh /tools.sh
COPY ["mapextractor", "mmaps_generator", "vmap4assembler", "vmap4extractor", "${install_prefix}/bin/"]
RUN chmod +x "${install_prefix}/bin"/* /tools.sh

VOLUME /artifacts

ENV DEBIAN_FRONTEND newt

ENTRYPOINT ["/tools.sh"]
CMD ["-o", "/artifacts", "-i", "/World_of_Warcraft"]

