{ config, pkgs, lib, ... }:{ 
#System Packages
services.xserver = {
  displayManager.gdm.enable = true;
  desktopManager.gnome.enable = true;
};
boot.loader = {
  systemd-boot.enable = true;
  efi.canTouchEfiVariables = true;
};
boot.kernelModules = [ "snd-seq" "snd-rawmidi" ];

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
  cmatrix
  zip
  nmap
  sshpass
  nextcloud-client
  gparted
];}
