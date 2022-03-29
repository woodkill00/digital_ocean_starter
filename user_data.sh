#!/bin/bash
# {USER} edit to desired username

apt-get update -y
apt-get upgrade -y
apt-get autoremove -y
adduser --uid 1000 --disabled-password --gecos GECOS {USER}
usermod -aG sudo {USER}
mkdir /home/{USER}/.ssh
mkdir /home/{USER}/scripts
touch /home/{USER}/.ssh/authorized_keys
cp .ssh/authorized_keys /home/{USER}/.ssh/authorized_keys
chmod 700 /home/{USER}/.ssh
chmod 600 /home/{USER}/.ssh/authorized_keys
chown 1000:1000 -R /home/{USER}/.ssh

curl -SL https://github.com/woodkill00/digital_ocean_starter.git -o /home/{USER}/scripts
chown 1000:1000 -R /home/{USER}/scripts
