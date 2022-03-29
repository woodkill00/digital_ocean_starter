#!/bin/sh
# run as $USER
set -o errexit
set -o nounset

IFS=$(printf '\n\t')

# Docker
sudo apt remove --yes docker docker-engine docker.io containerd runc || true
sudo apt update
sudo apt --yes --no-install-recommends install ca-certificates curl gnupg lsb-release
wget --quiet --output-document=- https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository --yes "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu $(lsb_release --codename --short) stable"
sudo apt-get update
sudo apt-get --yes install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
docker --version
sudo systemctl enable docker
printf '\nDocker installed successfully\n\n'

printf 'Waiting for Docker to start...\n\n'
sleep 5

# Docker Compose
sudo mkdir -p ~/.docker/cli-plugins/
sudo chown $USER -R ~/.docker
curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
sudo chown $USER /var/run/docker.sock
docker compose version
printf '\nDocker Compose installed successfully\n\n'
