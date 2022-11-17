# Server config
Basic Ubuntu server setup guide and Docker compose files for services I like. Start with with the basic server setup, install the base install compose stack, and then install any other containers you like.

# Basic Ubuntu server setup
This guide assumes you have a fresh Ubuntu server installed. At the time of writing, I'm using Ubuntu server 22.10. Most of this will work on other Linux distributions, but you'll need to adapt it for your package manager / general setup.

## Create a non-root user and disable logging in as root
It's a good idea to create a new user, give them root privileges, and disable logging in as root. That way, if someone does manage to gain access to your server, they still need your password to run anything as root. Here's how:

### Set up a new user
First, add a user (replace USER with the username you want):
```bash
adduser USER
```
Then, add that user to the sudo group:
```bash
usermod -aG sudo USER
# The -aG option appends the user to the chosen group (sudo).
```

### Disable logging in as root
On the remote server, edit `/etc/ssh/sshd_config` and set `PermitRootLogin` to `no`

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

## Set up a firewall

==TO DO==

## Add swap space
This step is optional. I've found that some servers with low memory can start to crash without a swap file, so try adding one if you're getting timeout errors or other crashes.

Swap space is a chunk of harddrive space that the system can use when it runs out of RAM. It's slower than RAM, but it acts as a safeguard if your system runs out of RAM. Here's how to add a swap file:

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
```bash
sudo fallocate -l 1G /swapfile
```

### Enable swap
```bash
sudo chmod 600 /swapfile
```
```bash
sudo mkswap /swapfile
```
```bash
sudo swapon /swapfile
```
```bash
sudo swapon --show
```
```bash
sudo cp /etc/fstab /etc/fstab.backup
```
```bash
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

# Base install compose stack
Contains a compose file that sets up Nginx Proxy Manager and Portainer; a good starting point for server if you want to manage adding additional containers through a GUI.

## More to come
I'll be adding more compose files that will plug in to the base install.

**Up next**:
- Watchtower
- Nextcloud