FROM ubuntu:22.04 as build

RUN export DEBIAN_FRONTEND=noninteractive; apt-get -qqy update &&  apt-get install -y \
    make g++ gcc tzdata vim-tiny automake git libtool

RUN git clone https://github.com/Mellanox/sockperf.git
RUN cd sockperf && ./autogen.sh && ./configure && make && chmod a+x sockperf

FROM ubuntu:22.04
RUN export DEBIAN_FRONTEND=noninteractive; apt-get -qqy update &&  apt-get install -y \
    iputils-arping iputils-ping iputils-tracepath dnsutils iperf3 net-tools iproute2 netcat \
    telnet openssh-server openssh-client curl jq vim-tiny

RUN apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*

COPY --from=build sockperf/sockperf /bin/sockperf

CMD ["/bin/bash"]
