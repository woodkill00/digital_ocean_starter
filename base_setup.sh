#!/bin/sh
# run with $USER

set -o errexit
set -o nounset

IFS=$(printf '\n\t')

# Update | Upgrade | Clean
sudo apt-get update && sudo apt-get upgrade -y
sudo apt autoremove -y

# Curl
sudo apt install curl
printf '\nCurl installed successfully\n\n'

# Pip
sudo apt-get install python3-pip -y
printf '\nPip installed successfully\n\n'

# Pip Update
python3 -m pip install --upgrade pip
printf '\nPip updated successfully\n\n'

# Venv
sudo apt-get install python3-venv -y
printf '\nVenv installed successfully\n\n'

# Make
sudo apt install make
printf '\nMake installed successfully\n\n'

# Essentials
# sudo apt-get install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget
sudo apt-get install build-essential wget
printf '\nEssentials installed successfully\n\n'


