#!/bin/bash
#
# This script configures a Ubuntu 18.10 (Cosmic Cuttlefish) distribution.

# Repository for Google Chrome
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# Repository for Oracle Java 8
sudo sh -c 'echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/oracle-java.list'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886

# Repository for Spotify
sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90

# Repository for Docker
sudo sh -c 'echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" > /etc/apt/sources.list.d/docker.list'
wget -q -O - https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Repository for Microsoft
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/ubuntu/17.04/prod zesty main" > /etc/apt/sources.list.d/microsoft.list'
wget -q -O - https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

# Update repository
sudo apt update

# Install common software
sudo apt --yes --force-yes install zsh subversion git meld google-chrome-stable oracle-java8-installer maven colordiff openssh-server curl spotify-client docker-ce xclip mssql-cli
sudo apt upgrade

# Add user to the docker group
sudo gpasswd --add $USER docker

# Install Eclipse
cd /opt
sudo wget http://saimei.acc.umu.se/mirror/eclipse.org/technology/epp/downloads/release/2018-09/R/eclipse-java-2018-09-linux-gtk-x86_64.tar.gz -O eclipse.tar.gz
sudo tar -zxvf eclipse.tar.gz
sudo ln -s /opt/eclipse/eclipse /usr/local/bin/eclipse
mkdir -p ~/.local/share/applications
cd ~/.local/share/applications
echo "[Desktop Entry]" > eclipse.desktop
echo "Type=Application" >> eclipse.desktop
echo "Name=Eclipse" >> eclipse.desktop
echo "Comment=Eclipse Integrated Development Environment" >> eclipse.desktop
echo "Icon=/opt/eclipse/icon.xpm" >> eclipse.desktop
echo "Exec=/opt/eclipse/eclipse" >> eclipse.desktop
echo "Categories=Development;IDE;Java;" >> eclipse.desktop
sudo rm /opt/eclipse.tar.gz

# Install Postman
cd /opt
sudo wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -zxvf postman.tar.gz
cd ~/.local/share/applications
echo "[Desktop Entry]" > postman.desktop
echo "Type=Application" >> postman.desktop
echo "Name=Postman" >> postman.desktop
echo "Comment=Postman" >> postman.desktop
echo "Icon=/opt/Postman/app/resources/app/assets/icon.png" >> postman.desktop
echo "Exec=/opt/Postman/app/Postman" >> postman.desktop
echo "Categories=HTTP;REST;Client;" >> postman.desktop
sudo rm /opt/postman.tar.gz

# Install Microsoft Azue Data Studio
cd /opt
sudo wget https://go.microsoft.com/fwlink/?linkid=2030741 -O azure-data-studio.tar.gz
sudo tar -zxvf azure-data-studio.tar.gz
cd ~/.local/share/applications
echo "[Desktop Entry]" > azure-data-studio.desktop
echo "Type=Application" >> azure-data-studio.desktop
echo "Name=Azure Data Studio" >> azure-data-studio.desktop
echo "Comment=Microsoft Azure Data Studio" >> azure-data-studio.desktop
echo "Icon=/opt/azuredatastudio-linux-x64/resources/app/resources/linux/code.png" >> azure-data-studio.desktop
echo "Exec=/opt/azuredatastudio-linux-x64/azuredatastudio" >> azure-data-studio.desktop
echo "Categories=Development;IDE;SQL;" >> azure-data-studio.desktop
sudo rm /opt/azure-data-studio.tar.gz
