{ config, pkgs, lib, ... }:{ 
#System Packages
services.xserver = {
  displayManager.gdm.enable = true;
  desktopManager.gnome.enable = true;
};
nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
]; 

environment.systemPackages = with pkgs; [
  vim
  wget
  vulkan-tools
  mesa  
  rclone 
  gnome-tweaks 
  glxinfo #opengl stuff
  htop 
  git 
  signal-desktop
  libreoffice-qt6-fresh
  killall
  protonvpn-gui
  findutils
  picom
  calibre
  neofetch
  inetutils
  ocs-url
  lshw #List Hardware
  chromium
  usbutils
  unzip
  prismlauncher
  qjackctl
  arduino
  mpv
  gimp
  dolphin-emu
  blender
  cmatrix
  gparted
  rpi-imager
  ardour
  nextcloud-client
  wineWowPackages.full
  wineasio
  nmap
  winetricks
];}
