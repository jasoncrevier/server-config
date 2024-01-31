# Basic Debian server setup
This page walks through the process for setting up a basic Debian server environment.

Most of this will work on other Linux distributions, but you'll need to adapt it for your package manager / general setup.

## On this page
- [Set up your environment](#set-up-your-environment)
- [Disable logging in as root](#disable-logging-in-as-root)
- [Set up SSH keys](#set-up-ssh-keys)
- [Set up a firewall](#set-up-a-firewall)
- [Add swap space](#add-swap-space)
- [What's next?](#whats-next)

## Set up your environment

I wrote a script that installs Docker along with a few important tools for using a headless Debian server. 

Before running it, read it over and make sure you understand what it does. Find it here: [Debian setup script](debian_setup.sh)

This script assumes you've finished installing Debian and that you set up a separate (non-root) user. Having a non-root user is good for security.

> :warning: **Note:** this script (probably) only works on Debian.

To install it, log into your server and enter these commands in the terminal:

First, switch to root:

```bash
su -
# The dash is important to set up the right login environment
```
Then, install git:

```bash
apt install git
```
Then, clone this repo, and navigate to the folder with the script:
```bash
git clone https://github.com/jasoncrevier/server-config
cd server-config/setup/basic\ server\ setup/
```
Then, make the script executable:
```bash
chmod +x debian_setup.sh
```
Then, run the script:
```bash
./debian_setup.sh
# Runs the script
```
Then:
- Enter your username when it prompts you
- Press Y.

Lastly, log out of your server and log back in to apply docker and sudo access.

[Back to top](#on-this-page)

## Disable logging in as root

It's a good idea to create a non-root user, give them permission to use sudo (to escalate to root on a per-command basis), and disable logging remotely through ssh as root. That way, if someone does manage to gain access to your server, they still need your password to run anything as root.

### Set up a new user (you can skip this if you used the setup script above)

First, add a user (replace USER with the username you want):

```bash
adduser USER
```

Then, add that user to the sudo group:

```bash
usermod -aG sudo USER
# The -aG option appends the user to the chosen group (sudo).
```

### Disable logging in as root remotely

On the remote server, edit `/etc/ssh/sshd_config` and set `PermitRootLogin` to `no`

[Back to top](#on-this-page)

## Set up SSH keys

For added security, create SSH keys you can use to log into the server without a password. Anyone who wants to log in *must* have a private key. Here's how:

### Generate and upload keys

On your local machine, run the ssh-keygen command:

```bash
ssh-keygen -t rsa -b 4096 -f /PATH/TO/KEYS
# -t lets you specify the type of key (RSA). 
# -b lets you specify the number of bits in the key (4096). 
# -f lets you set the location to save the keys. By default, keys are stored in ~/.ssh/id_rsa
```

Then, run the ssh-copy-id command to copy your public key to the remote server:

```bash
ssh-copy-id -i /PATH/TO/KEYS username@remote_host
# -i lets you specify the location of the key. Use it if your keys are not in the default location. By default, keys are stored in ~/.ssh/id_rsa
```

### Turn off password authentication

On the remote server, edit `/etc/ssh/sshd_config` and set `PasswordAuthentication` to `no`

[Back to top](#on-this-page)

## Set up a firewall

I recommend [UncomplicatedFirewall (UFW)](https://en.wikipedia.org/wiki/Uncomplicated_Firewall) as a simple, easy to use firewall manager.

> :bulb: Tip: Docker port mappings will override UFW. You can avoid forwading ports directly to the internet in your docker commands by mapping ports to the localhost. For example: 127.0.0.1:81:81
>
> See my base install compose file for examples: [base install](/setup/base%20install/docker-compose.yml)

Here's how I recommend setting it up:

### Install UFW
If you used the setup script above UFW should be installed already. If it's not, install it with this command:
```bash
sudo apt install ufw
```

### Block all incoming ports by default
Tell UFW to block all incoming ports and allow all outgoing ports with these commands:
```bash
sudo ufw default deny incoming
sudo ufw allow outgoing
```

### Allow some required ports
If you're setting up your server remotely over SSH, it's very important that you open your SSH port (the default is 22) in your firewall. If you don't, you'll lock yourself out when you enable it.

Do that with this command:
```bash
sudo ufw allow 22
```

You'll probably also want to open ports for web traffic:
```bash
sudo ufw allow 80
sudo ufw allow 443
```
If you're using my [base install](/setup/base%20install) compose stack you'll also want to open the admin port for Nginx Proxy Manager:
```bash
sudo ufw allow 81
```
You can create an entry to redirect a domain to the admin page instead and close the port later:
```bash
sudo ufw deny 81
```

### Enable UFW
Start UFW with this command:
```bash
sudo ufw enable
```
You can disable it with this command:
```bash
sudo ufw disable
```

[Back to top](#on-this-page)

## Add swap space

This step is optional. I've found that some servers with low memory can start to crash without a swap file, so try adding one if you're getting timeout errors or other crashes.

Swap space is a chunk of harddrive space that the system can use when it runs out of RAM. It's slower than RAM, but it acts as a safeguard if your system runs out of RAM. 

Here's how to add a swap file:

### Check if you already have swap space allocated

Run this command:

```bash
sudo swapon --show
```

If nothing happens, then your system does not currently have swap space.

### Check if you have enough harddrive space

Run this command:

```bash
df -h
```

You'll see something like this:

```bash
Filesystem      Size  Used Avail Use% Mounted on
tmpfs            97M  1.5M   95M   2% /run
/dev/sda1        49G  6.4G   42G  14% / # This is the harddrive
tmpfs           483M     0  483M   0% /dev/shm
tmpfs           5.0M     0  5.0M   0% /run/lock
/dev/sda15      105M  5.3M  100M   5% /boot/efi
tmpfs            97M  4.0K   97M   1% /run/user/1001
```

In this example, I'm using 6.4Gb out of a total 49Gb -- plenty left over for swap space.

### Create a swap file

Run this command:
```bash
sudo fallocate -l 1G /swapfile
```

### Enable swap

Run these commands:
```bash
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo swapon --show
sudo cp /etc/fstab /etc/fstab.backup
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

[Back to top](#on-this-page)

## What's next?
Now that your server is set up, you can start installing services. I recommend setting up my [base install](/setup/base%20install) compose stack. It gives you 2 useful containers:

- Portainer -- A GUI for managing docker containers
- Nginx proxy manager -- A reverse proxy with a GUI and built in letsencrypt module for generating SSL certificates

Then you can use the **Stacks** feature in **Portainer** to easily add any of the services in this repo to your base install.

[Back to top](#on-this-page)
