#!/bin/sh
set -eu

# setup natting
iptables -A FORWARD -i eth0 -o tun0 -j ACCEPT
iptables -A FORWARD -i tun0 -o eth0 -j ACCEPT
iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
# add route back to the transit network
ip route add 192.168.0.0/16 via 192.168.0.1 dev eth0

cd /vpn
exec openvpn --config client.ovpn
