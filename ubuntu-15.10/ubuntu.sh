#!/bin/bash
#
# This script configures an Ubuntu 15.10 (Wily Werewolf) distribution.

# Add necessary APT lists and APT keys
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo sh -c 'echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu wily main" >> /etc/apt/sources.list.d/oracle-java.list'
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian wily contrib" >> /etc/apt/sources.list.d/virtualbox.org.list' 
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
wget -q -O - http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc | sudo apt-key add -

# Add 32-bits architecture (for Skype)
sudo dpkg --add-architecture i386

# Update repository
sudo apt-get update

# Install common software
sudo apt-get --yes --force-yes install subversion git meld google-chrome-stable oracle-java7-installer oracle-java8-installer maven skype virtualbox-5.0

# Remove redundant software
sudo apt-get --yes --force-yes --purge remove firefox*

# Install Eclipse Mars
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
