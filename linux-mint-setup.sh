#!/bin/bash
#
# This script configures a Linux Mint distribution.

# Add necessary APT lists and APT keys
cd /etc/apt/sources.list.d
sudo echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > google-chrome.list
sudo echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" > oracle-java.list
sudo echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> oracle-java.list
sudo echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" > virtualbox.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
wget -q -O - https://www.virtualbox.org/download/oracle_vbox.asc | sudo apt-key add -
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# Install common software
sudo apt-get update
sudo apt-get --yes --force-yes install meld subversion git google-chrome-stable oracle-java7-installer oracle-java8-installer maven tightvncserver xrdp virtualbox-5.0 skype

# Remove redundant software
sudo apt-get --yes --force-yes --purge remove openjdk-7-jre* firefox*

# Install Eclipse
cd /opt
sudo wget http://saimei.acc.umu.se/mirror/eclipse.org/technology/epp/downloads/release/mars/1/eclipse-java-mars-1-linux-gtk-x86_64.tar.gz
sudo tar -zxvf eclipse-java-mars-1-linux-gtk-x86_64.tar.gz
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

# Reboot!
sudo reboot

