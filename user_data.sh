#!/bin/bash

echo "**********RUNNING BASH SCRIPT**********"
echo "**********UPDATE'N**********"
DEBIAN_FRONTEND=noninteractive \
        apt-get \
                -o Dpkg::Options::="--force-confnew" \
                update
echo "**********UPGRADING**********"
DEBIAN_FRONTEND=noninteractive \
        apt-get \
                -o Dpkg::Options::="--force-confnew" \
                --force-yes \
                -fuy \
                upgrade
echo "**********UPGRADING END**********"
echo "**********DIST-UPGRADING**********"
DEBIAN_FRONTEND=noninteractive \
        apt-get \
                -o Dpkg::Options::="--force-confnew" \
                --force-yes \
                -fuy \
                dist-upgrade
echo "**********DIST-UPGRADING END**********"
echo "**********REMOVING**********"
apt autoremove -y
echo "**********REMOVING END**********"
newusr=
adduser --uid 1000 --disabled-password --gecos GECOS $newusr
echo "**********CREATING USER**********"
usermod -aG sudo $newusr
echo "**********CREATING USER END**********"
mkdir /home/$newusr/.ssh
touch /home/$newusr/.ssh/authorized_keys
cd ~/
cp .ssh/authorized_keys /home/$newusr/.ssh/authorized_keys
chmod 700 /home/$newusr/.ssh
chmod 600 /home/$newusr/.ssh/authorized_keys
chown 1000:1000 -R /home/$newusr/.ssh
echo "**********INSTALLING GIT**********"
sudo apt install git-all -y
echo "**********INSTALLING GIT END**********"
echo "**********CREATING DIRS**********"
mkdir /home/$newusr/scripts
mkdir /home/$newusr/base
cd /home/$newusr/scripts
git clone https://github.com/woodkill00/digital_ocean_starter.git .
chown 1000:1000 -R /home/$newusr/scripts
chown 1000:1000 -R /home/$newusr/base
chmod +x /home/$newusr/scripts/base_setup.sh
chmod +x /home/$newusr/scripts/docker_install.sh
echo "**********CREATING DIRS END**********"
echo "**********FIXING UFW**********"
sudo ufw allow 443
sudo ufw allow 22
sudo ufw allow 80
ufw enable
echo "**********FIXING UFW END**********"
echo "**********TURNING OFF APACHE**********"
sudo systemctl disable apache2 && sudo systemctl stop apache2
echo "**********TURNING OFF APACHE END**********"
echo "**********ENDING SCRIPT + REBOOTING**********"
reboot now
