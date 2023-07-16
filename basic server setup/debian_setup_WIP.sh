# Prompt the user to enter the username that should get sudo access
echo What username do you want to give sudo access to?
read VAR_USER

# Update and install additional packages
apt update -y
apt install ssh sudo ca-certificates curl gnupg micro fish -y

# Add the docker repository (these steps are from https://docs.docker.com/engine/install/debian)
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update and install docker packages
apt update -y
apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Give the username from before sudo and docker group access
usermod -aG sudo,docker $VAR_USER