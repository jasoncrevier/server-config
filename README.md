# My server config

This is a place for me to document and store my docker-compose and various other config files.

I make no guarantees that anything here is up-to-date or even working. But I'll do my best to keep it maintained. Hopefully you find it useful.

## How to use this repo

### :bulb: Get to know docker and compose

For this repo to be useful, you need to know the basics of [docker](https://www.docker.com/). In a nutshell, docker containers are applications that come bundled with everything they need to run. 

And also [docker compose](https://docs.docker.com/compose/): "a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration." 

All the applications in this repo are described in their own docker-compose.yml files.

### :rocket: Get your server set up

First, check out my [basic server setup](/basic%20server%20setup). If you're new to self-hosting, there's a few tips in there to help with performance and security.

Then, install the [base install](/base%20install) compose stack. It gives you 2 useful containers:

- Portainer -- A GUI for managing docker containers
- Nginx proxy manager -- A reverse proxy with a GUI and built in letsencrypt module for generating SSL certificates



## In this repo

### :construction_worker: Docker and reverse proxy management

- [Portainer + Nginx proxy manager (base install)](/base%20install)

### :book: Books

- [Calibre-web](/calibre-web)

### :placard: Dashboard

- [Dashy](/dashy)

### :chart_with_upwards_trend: Diagrams

- [Draw.io](/draw-io)

### :inbox_tray: RSS

- [FreshRSS](/freshrss)

### :package: Inventory management

- [HomeBox](/homebox)

### :shield: Alternative frontends

- [Libreddit](/libreddit)

### :open_file_folder: Storage and filesharing

- [Nextcloud](/nextcloud)
- [Snapdrop](/snapdrop)

### :clipboard: DNS

- [Pihole](/pihole)

### :eye: Monitoring

- [Uptime Kuma](/uptime%20kuma)

### :desktop_computer: Websites and wikis

- [WikiJS](/wikijs)
- [Wordpress](/wordpress)

### :earth_americas: Remote access

- [Wg-easy (Wireguard GUI)](/wg-easy)

### :notebook: Notes

- [Memos](/memos)