#! /bin/sh

echo "Deleting $1"
cp /usr/share/applications/$1.desktop ~/.local/share/applications/.
sudo rm /usr/share/applications/$1.desktop
sudo ln -s /dev/null /usr/share/applications/$1.desktop
