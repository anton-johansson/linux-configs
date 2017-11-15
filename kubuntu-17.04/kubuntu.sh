#!/bin/bash
#
# This script configures a Kubuntu 17.04 (Zesty Zapus) distribution.

# Add necessary APT lists and APT keys
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list'
sudo sh -c 'echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/oracle-java.list'
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" > /etc/apt/sources.list.d/virtualbox.org.list'
sudo sh -c 'echo "deb https://download.docker.com/linux/ubuntu $(lsb_release -sc) stable" > /etc/apt/sources.list.d/docker.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
wget -q -O - http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc | sudo apt-key add -
wget -q -O - https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Update repository
sudo apt-get update

# Install common software
sudo apt-get --yes --force-yes install zsh subversion git meld google-chrome-stable oracle-java8-installer maven virtualbox-5.1 colordiff docker-ce openssh-server

# Fix Eclipse web components (such as JavaDocs)
sudo apt-get --yes --force-yes install libwebkitgtk-3.0-0

# Add user to the docker group
sudo gpasswd -a $USER docker

# Install Eclipse Mars
cd /opt
sudo wget http://saimei.acc.umu.se/mirror/eclipse.org/technology/epp/downloads/release/oxygen/R/eclipse-java-oxygen-R-linux-gtk-x86_64.tar.gz
sudo tar -zxvf eclipse-java-oxygen-R-linux-gtk-x86_64.tar.gz
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

# Install Postman
cd /opt
sudo wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -zxvf postman.tar.gz
cd ~/.local/share/applications
echo "[Desktop Entry]" > postman.desktop
echo "Type=Application" >> postman.desktop
echo "Name=Postman" >> postman.desktop
echo "Comment=Postman" >> postman.desktop
echo "Icon=/opt/Postman/resources/app/assets/icon.png" >> postman.desktop
echo "Exec=/opt/Postman/Postman" >> postman.desktop
echo "Categories=HTTP;REST;Client;" >> postman.desktop

# Install Microsoft SQL Operations Studio
cd /opt
sudo wget https://go.microsoft.com/fwlink/?linkid=862646 -O sql-operations-studio.tar.gz
sudo tar -zxvf sql-operations-studio.tar.gz
cd ~/.local/share/applications
echo "[Desktop Entry]" > sql-operations-studio.desktop
echo "Type=Application" >> sql-operations-studio.desktop
echo "Name=SQL Operations Studio" >> sql-operations-studio.desktop
echo "Comment=Microsoft SQL Operations Studio" >> sql-operations-studio.desktop
echo "Icon=/opt/sqlops-linux-x64/resources/app/resources/linux/code.png" >> sql-operations-studio.desktop
echo "Exec=/opt/sqlops-linux-x64/sqlops" >> sql-operations-studio.desktop
echo "Categories=Development;IDE;SQL;" >> sql-operations-studio.desktop
sudo rm /opt/sql-operations-studio.tar.gz
