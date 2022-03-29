# digital_ocean_starter
starter script for digital ocean droplet


during droplet creation enable {user data} option
add to meta data
# edit {USER} to desired user

#!/bin/bash

apt-get update -y
apt-get upgrade -y
apt-get autoremove -y
adduser --uid 1000 --disabled-password --gecos GECOS {USER}
usermod -aG sudo {USER}
mkdir /home/{USER}/.ssh
touch /home/{USER}/.ssh/authorized_keys
cp .ssh/authorized_keys /home/{USER}/.ssh/authorized_keys
chmod 700 /home/{USER}/.ssh
chmod 600 /home/{USER}/.ssh/authorized_keys
chown 1000:1000 -R /home/{USER}/.ssh

-----------------------------------------------------------------------------------------------------------------------------------------------------------# will still need to ssh as root to create password for {USER} if you need to use sudo cmd
passwd {USER}
