# network-test
Simple docker container with networking tools

Based on Ubuntu 22.04, includes:
iproute2, net-tools, sockperf**, tracepath, ping, arpping, ssh, curl, jq, telnet, nc

** -- 'sockperf' is a multicast packet test tool written by Mellanox. https://github.com/Mellanox/sockperf

This container can be used to test or debug networking issues on Kubernetes or Docker.
