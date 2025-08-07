# Mumble Server

[Mumble](https://www.mumble.info/) is an open source, low-latency, high quality voice chat software.

This stack sets up a Mumble server (also known as Murmur).

## How to use it
Before starting the container, you must set a password for the `SuperUser` by editing the `MUMBLE_SUPW` environment variable in the `compose.yml` file.

## Firewall Configuration
Unlike the other web-based services in this repository, Mumble is not a web application and cannot be placed behind the Nginx Proxy Manager for web traffic. It requires its own port to be accessible from the internet.

The compose file exposes port `64738` for both TCP and UDP traffic. You will need to allow this port through your server's firewall.

If you followed the basic server setup guide and are using UFW, you can open the port with the following commands:
```bash
sudo ufw allow 64738/tcp
sudo ufw allow 64738/udp
```

## Learn more
- Mumble website
- mumble-server Docker image on GitHub