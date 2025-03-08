# My server config

This is a place for me to document and store my docker-compose and various other config files.

I make no guarantees that anything here is up-to-date or even working. But I'll do my best to keep it maintained. Hopefully you find it useful.

## How to use this repo

### :bulb: Get to know docker and compose

For this repo to be useful, you need to know the basics of [docker](https://www.docker.com/). In a nutshell, docker containers are applications that come bundled with everything they need to run. 

And also [docker compose](https://docs.docker.com/compose/): "a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration." 

All the applications in this repo are described in their own docker-compose.yml files.

### :rocket: Set up your server

First, check out my [basic server setup](setup/basic%20server%20setup). If you're new to self-hosting, there's a few tips in there to help with performance and security.

Then, install the [base install](setup/base%20install) compose stack. It gives you 2 useful containers:

- Portainer -- A GUI for managing docker containers
- Nginx proxy manager -- A reverse proxy with a GUI and built in letsencrypt module for generating SSL certificates



## In this repo

### :construction_worker: Docker and reverse proxy management

- [Portainer + Nginx proxy manager (base install)](setup/base%20install)

### :book: Books

- [Audiobookshelf](/containers/audiobookshelf/)
- [Calibre-web](/containers/calibre-web)

### :chart_with_upwards_trend: Budgeting

- [Actual](/containers/actualbudget/)

### :placard: Dashboard

- [Dashy](/containers/dashy)

### :bar_chart: Diagrams

- [Draw.io](/containers/draw-io)

### :arrow_down: Downloads

- [YoutubeDL-Material](/containers/youtubedl-material)

### :inbox_tray: RSS

- [FreshRSS](/containers/freshrss)

### :package: Inventory management

- [HomeBox](/containers/homebox)

### :shield: Alternative frontends

- [Alexandrite (Lemmy)](/containers/alexandrite)
- [Photon (Lemmy)](/containers/photon)
- [Redlib (Reddit)](/containers/redlib)
- [Viewtube (YouTube)](/containers/viewtube)

### :open_file_folder: Storage and filesharing

- [Nextcloud](/containers/nextcloud)
- [Snapdrop](/containers/snapdrop)

### :clipboard: DNS

- [Pihole](/containers/pihole)

### :eye: Monitoring

- [Uptime Kuma](/containers/uptime%20kuma)

### :desktop_computer: Websites and wikis

- [Pico CMS](/containers/pico-cms)
- [WikiJS](/containers/wikijs)
- [Wordpress](/containers/wordpress)
- [ghost](/containers/ghost)

### :computer: Coding

- [Forgejo](/containers/forgejo)

### :earth_americas: Remote access

- [Wg-easy (Wireguard GUI)](/containers/wg-easy)

### :notebook: Notes

- [Memos](/containers/memos)

### :bookmark_tabs: Productivity

- [OpenSupports](/containers/opensupports/)
- [Super Productivity](/containers/super-productivity/)
