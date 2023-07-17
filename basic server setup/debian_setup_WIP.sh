# Update and install additional packages
apt update -y
apt upgrade -y
apt install sudo ca-certificates curl gnupg micro fish -y

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

# Prompt for a username to add to the sudo and docker groups
while true; do
echo -e "\e[0m"
read -p "Enter the username you want to give access to sudo and docker: " VAR_USER
echo
read -p "Are you sure you want to give sudo and docker access to $VAR_USER? (y/N) " -n 1 VAR_SELECTION

case $VAR_SELECTION in
  [Yy]* ) usermod -aG sudo,docker $VAR_USER;; break;;
  [Nn]* ) echo -e $'\n\n\e[1mLet\'s try again';;
  * ) echo $'\n\e[1mLet\'s try again';;
esac
done