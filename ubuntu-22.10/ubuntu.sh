#!/bin/bash
#
# This script configures a Ubuntu 22.10 (Kinetic Kudo) distribution.

# Repository for Google Chrome
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# Repository for Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update repository
sudo apt update

# Install common software
sudo apt --yes --force-yes install zsh google-chrome-stable subversion git meld maven colordiff curl apt-transport-https ca-certificates software-properties-common docker-ce xclip
sudo apt upgrade

# Add user to the docker group
sudo usermod -aG docker ${USER}

# Install Maven
cd ~/Downloads
wget https://mirrors.estointernet.in/apache/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz
tar -xvf apache-maven-3.8.5-bin.tar.gz
sudo mv apache-maven-3.8.5 /opt/
