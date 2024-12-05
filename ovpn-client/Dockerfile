FROM ubuntu:24.04

RUN apt update \
  && apt install curl iproute2 iptables openvpn -y \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /
COPY ./run.sh /run.sh

CMD ["/run.sh"]
