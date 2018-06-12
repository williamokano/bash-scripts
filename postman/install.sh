#!/bin/bash

if [[ $(id -u) -ne 0 ]];then
    echo "Please run as root";
    exit 1;
fi

cd /tmp || exit
if [ -f Postman*.tar.gz ];then
    echo "Removing old postman download"
    rm Postman*.tar.gz
fi

echo "Trying to download postman"
wget -q --show-progress "https://dl.pstmn.io/download/latest/linux64" --content-disposition

if [ $? -gt 0 ]; then
    echo "Failed to download Postman tarball"
    exit 1;
fi

if [ -d Postman ]; then
    echo "Removing old postman download folder"
    rm -rf Postman
fi

if [ -f Postman*.tar.gz ]; then
    echo "WTF? Where is the file?"
    exit 1;
fi

tar -xzf Postman*.tar.gz

echo "Installing Postman"
if [ -d "/opt/Postman" ];then
    echo "Other Postman installation detected. Removing..."
    rm -rf /opt/Postman
fi
mv Postman /opt/Postman

echo "Creating symbolic link"
if [ -L "/usr/bin/postman" ];then
    echo "Deleting old link..."
    rm -f /usr/bin/postman
fi

sudo ln -s /opt/Postman/Postman /usr/bin/postman

versionMaj=$(ls Postman*.tar.gz | awk -F '-' '{ print $4 }' | awk -F '.' '{ print $1 }')
versionMin=$(ls Postman*.tar.gz | awk -F '-' '{ print $4 }' | awk -F '.' '{ print $2 }')
versionRev=$(ls Postman*.tar.gz | awk -F '-' '{ print $4 }' | awk -F '.' '{ print $3 }')
version="$versionMaj.$versionMin.$versionRev"

echo "Postman version $version"

echo "Installing Postman.desktop file"
if [ -f "/usr/share/applications/postman.desktop" ];then
    echo "Deleting old postman.desktop entry"
    rm -f /usr/share/applications/postman.desktop
fi

touch /usr/share/applications/postman.desktop
echo "[Desktop Entry]" > /usr/share/applications/postman.desktop
echo "Encoding=UTF-8" >> /usr/share/applications/postman.desktop
echo "Name=Postman" >> /usr/share/applications/postman.desktop
echo "Exec=postman" >> /usr/share/applications/postman.desktop
echo "Icon=/opt/Postman/app/resources/app/assets/icon.png" >> /usr/share/applications/postman.desktop
echo "Terminal=false" >> /usr/share/applications/postman.desktop
echo "Type=Application" >> /usr/share/applications/postman.desktop
echo "Categories=Development;" >> /usr/share/applications/postman.desktop

echo "Postman Installed"