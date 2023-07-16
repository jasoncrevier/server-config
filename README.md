# My server config

This is a place for me to document and store my docker-compose and various other config files.

I make no guarantees that anything here is up-to-date or even working. But I'll do my best to keep it maintained. Hopefully you find it useful.

## How to use this repo

### :bulb: Get to know docker and compose

For this repo to be useful, you need to know the basics of [docker](https://www.docker.com/). In a nutshell, docker containers are applications that come bundled with everything they need to run. 

And also [docker compose](https://docs.docker.com/compose/): "a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration." 

All the applications in this repo are described in their own docker-compose.yml files.

### :rocket: Get your server set up

First, check out my [basic server setup](https://github.com/jasoncrevier/server-config/tree/main/basic%20server%20setup). If you're new to self-hosting, there's a few tips in there to help with performance and security.

Then, install the [base install](https://github.com/jasoncrevier/server-config/tree/main/base%20install) compose stack. It gives you 2 useful containers:

- Portainer -- A GUI for managing docker containers
- Nginx proxy manager -- A reverse proxy with a GUI and built in letsencrypt module for generating SSL certificates



## In this repo

- [Portainer + Nginx proxy manager (base install)](/base%20install)
- [Calibre-web](https://github.com/jasoncrevier/server-config/tree/main/calibre-web)
- [Dashy](https://github.com/jasoncrevier/server-config/tree/main/dashy)
- [Draw.io](https://github.com/jasoncrevier/server-config/tree/main/draw-io)
- [FreshRSS](https://github.com/jasoncrevier/server-config/tree/main/freshrss)
- [HomeBox](https://github.com/jasoncrevier/server-config/tree/main/homebox)
- [Libreddit](https://github.com/jasoncrevier/server-config/tree/main/libreddit)
- [Nextcloud](https://github.com/jasoncrevier/server-config/tree/main/nextcloud)
- [Pihole](https://github.com/jasoncrevier/server-config/tree/main/pihole)
- [Snapdrop](https://github.com/jasoncrevier/server-config/tree/main/snapdrop)
- [Uptime Kuma](https://github.com/jasoncrevier/server-config/tree/main/uptime%20kuma)
- [Wg-easy (Wireguard GUI)](https://github.com/jasoncrevier/server-config/tree/main/wg-easy)
- [WikiJS](https://github.com/jasoncrevier/server-config/tree/main/wikijs)
- [Wordpress](https://github.com/jasoncrevier/server-config/tree/main/wordpress)

## :white_check_mark: To do

- Create READMEs for all of these services
- Add firewall section to basic server setup