# Base install

This folder contains a compose file that sets up Nginx Proxy Manager and Portainer; a good starting point for server if you want to manage adding additional containers through a GUI.

## How to use it
Clone this repo and navigate to the base install folder:
```bash
git clone https://github.com/jasoncrevier/server-config
cd server-config/basic\ server\ setup/base\ install/
```

Then run the compose stack:
```bash
docker compose up -d
```

## What you get
At the risk of turning this into a blog post, I wanted to explain the reasoning behind some of my setup here.

### A modular base
The compose file in this base install sets up ```frontend``` and ```backend``` docker networks. It also exposes just the ports you need to keep all the rest of your containers behind a reverse proxy.

To keep things secure, the rest of the compose stacks in this repo map themselves to the right networks and don't forward any ports by default (which would subvert your firewall). Instead, you create a proxy host in Nginx Proxy Manager for each container, using its name and container port.

### Nginx Proxy Manager

A reverse proxy with a GUI and built in letsencrypt module for generating SSL certificates.

**Learn more**
- [Nginx Proxy Manager website](https://nginxproxymanager.com/)

### Portainer

A GUI for managing docker containers.

**Learn more**
- [Portainer website](https://www.portainer.io/)

## Why not just use the command line?
You can, and probably should learn how to manage docker from the command line. There are lots of good tutorials out there, and it will help give you a better understanding of what's going on under the hood.

That said, GUIs are nice to have for a few reasons:

- **Discoverablity.** A typical GUI exposes available options to you. This can help you quickly learn what's possible without needing to dig through ```man``` pages or ```---help``` outputs.
- **They're easy.** I'm lazy and I want to be able to just click a few buttons and not have to type out all my commands. 