#!/bin/bash
#
# This script installs Eclipse.
# Usage: sudo ./eclipse.sh neon 1a


###############################################
# Check input arguments
###############################################

if [ "$(whoami)" != "root" ]; then
    echo "Sorry, you are not root."
    exit 1
fi

if [ ! -z "$1" ]; then
    generation="$1"
else
    echo "Invalid generation"
    exit 1
fi

if [ ! -z "$2" ]; then
    version="$2"
else
    echo "Invalid version"
    exit 1
fi

###############################################
# Download Eclipse
###############################################

echo "Downloading Eclipse $generation $version..."
sudo wget -O /opt/eclipse.tar.gz http://saimei.acc.umu.se/mirror/eclipse.org/technology/epp/downloads/release/$generation/$version/eclipse-java-$generation-$version-linux-gtk-x86_64.tar.gz

if [ $? -ne 0 ]; then
    echo "Could not find Eclipse version"
fi


###############################################
# Extract Eclipse
###############################################

sudo rm -rf /opt/eclipse
sudo tar -zxf /opt/eclipse.tar.gz -C /opt/
sudo rm -f /opt/eclipse.tar.gz
sudo rm -f /usr/local/bin/eclipse
sudo ln -s /opt/eclipse/eclipse /usr/local/bin/eclipse


###############################################
# Create launcher
###############################################

if [ -d "$HOME/.local/share/applications" ]; then
    echo "[Desktop Entry]" > $HOME/.local/share/applications/eclipse.desktop
    echo "Type=Application" >> $HOME/.local/share/applications/eclipse.desktop
    echo "Name=Eclipse" >> $HOME/.local/share/applications/eclipse.desktop
    echo "Comment=Eclipse Integrated Development Environment" >> $HOME/.local/share/applications/eclipse.desktop
    echo "Icon=/opt/eclipse/icon.xpm" >> $HOME/.local/share/applications/eclipse.desktop
    echo "Exec=/opt/eclipse/eclipse" >> $HOME/.local/share/applications/eclipse.desktop
    echo "Categories=Development;IDE;Java;" >> $HOME/.local/share/applications/eclipse.desktop
fi
