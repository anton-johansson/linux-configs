#!/bin/bash
#
# This script configures a Ubuntu 24.04 (Noble Numbat) distribution.

# Update repository
sudo apt update

# Install common software
sudo apt --yes --force-yes install zsh subversion git meld colordiff curl xclip krb5-user
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
