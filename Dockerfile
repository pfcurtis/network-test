FROM ubuntu:18.04

RUN export DEBIAN_FRONTEND=noninteractive; apt-get -qqy update &&  apt-get install -y \
    iputils-arping iputils-ping iputils-tracepath dnsutils iperf3 net-tools iproute2 netcat \
    make g++ gcc tzdata vim automake git

RUN git clone https://github.com/Mellanox/sockperf.git
RUN cd sockperf && ./autogen.sh && ./configure && make

RUN apt-get -y purge gcc make automake g++ && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
