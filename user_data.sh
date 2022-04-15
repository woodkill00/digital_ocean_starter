#!/bin/bash
# {USER} edit to desired username

apt-get update -y
apt-get upgrade -y
apt-get autoremove -y
adduser --uid 1000 --disabled-password --gecos GECOS {USER}
usermod -aG sudo {USER}
mkdir /home/{USER}/.ssh
touch /home/{USER}/.ssh/authorized_keys
cd ~/
cp .ssh/authorized_keys /home/{USER}/.ssh/authorized_keys
chmod 700 /home/{USER}/.ssh
chmod 600 /home/{USER}/.ssh/authorized_keys
chown 1000:1000 -R /home/{USER}/.ssh
sudo apt install git-all -y
mkdir /home/{USER}/scripts
cd /home/{USER}/scripts
git clone https://github.com/woodkill00/digital_ocean_starter.git .
chown 1000:1000 -R /home/{USER}/scripts
chmod +x /home/{USER}/scripts/base_setup.sh
chmod +x /home/{USER}/scripts/docker_install.sh
sudo systemctl disable apache2 && sudo systemctl stop apache2
reboot now
