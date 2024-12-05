# routing-via-containers
A scalable setup for routing network traffic through Docker containers.

## Blog Post

For more info see the [Blog Post](https://safelyup.net/routing-network-traffic-through-docker-containers-c33cc91d4eb2).

## Deployment
Docker service and `docker compose` should already be installed on the host.

Enable packet forwarding for IPv4 and make it persistent by un-commenting or adding the line `net.ipv4.ip_forward=1` to file `/etc/sysctl.conf`. Also run:
```
$ sudo sysctl -w net.ipv4.ip_forward=1
```

Run `docker compose` to build and deploy the VPN Client containers, and connect them to the network:
```
$ docker compose build
$ docker compose up -d
$ docker ps
CONTAINER ID   IMAGE         COMMAND     CREATED         STATUS        NAMES
e2d0276a6188   ovpn-client   "/run.sh"   5 seconds ago   Up 4 seconds  vpn1
aa3bae592b73   ovpn-client   "/run.sh"   5 seconds ago   Up 4 seconds  vpn2
...
```

To check logs of any container:
```
$ docker logs <CONTAINER NAME or ID>
```
