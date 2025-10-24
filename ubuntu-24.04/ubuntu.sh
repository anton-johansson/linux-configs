#!/bin/bash
#
# This script configures a Ubuntu 24.04 (Noble Numbat) distribution.

# Add Microsoft Azure repository
curl -sL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/microsoft.gpg
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/azure-cli.list

# Update repository
sudo apt update

# Install common software
sudo apt --yes --force-yes install zsh subversion git meld colordiff curl xclip krb5-user file-roller dos2unix remmina ncdu azure-cli
sudo apt upgrade

# Create directory for additional certificates
mkdir /usr/local/share/ca-certificates/extra

# Install FNM
curl -fsSL https://fnm.vercel.app/install | bash

# Install Maven
cd ~/Downloads
wget https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz
tar -xvf apache-maven-3.9.9-bin.tar.gz
sudo mv apache-maven-3.9.9 /opt/apache-maven
