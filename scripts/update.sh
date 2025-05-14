#!/bin/sh

sudo nix-channel --update
sudo nixos-rebuild switch
cd /home/julios/git/nix-config/
git pull
cp /etc/nixos/configuration.nix /home/julios/git/nix-config/.
cp /etc/nixos/laptopapps.nix /home/julios/git/nix-config/.
cp -r /home/julios/scripts /home/julios/git/nix-config/.
git add .
git commit -m "Updated Nix Config on laptop"
git push origin main
