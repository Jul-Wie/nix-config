#!bin/sh

rm /home/julios/.backups/tempconf
rm /home/julios/.backups/backup.nix
cp /etc/nixos/laptopapps.nix /home/julios/.backups/backup.nix
sudo head -n -1 /etc/nixos/laptopapps.nix > /home/julios/.backups/tempconf
read -p "App to install: " app
echo "  $app" >> /home/julios/.backups/tempconf
echo "];}" >> /home/julios/.backups/tempconf
read -p "Enter anything to confirm" confirmation
sudo cp /home/julios/.backups/tempconf /etc/nixos/laptopapps.nix

