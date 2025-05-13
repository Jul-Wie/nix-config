{ config, pkgs, lib, ... }:{ 
#System Packages
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
  flatpak #steam
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
  corefonts
  prismlauncher
  qjackctl
  arduino
  mpv
  gimp
  dolphin-emu
  blender
  thunderbird
  qownnotes
];}

