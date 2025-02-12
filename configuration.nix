{ config, pkgs, lib, ... }:{ 
imports =
  [ 
    ./hardware-configuration.nix
    ./info.nix
  ];
  
system.stateVersion = "24.05"; # never make anything other than 24.05
time.timeZone = "Europe/Amsterdam";

#Base Hardware
services.libinput.enable = true;
services.thermald.enable = true;
powerManagement = {
  enable = true;
  powertop.enable = true;
};
boot.loader = {
  systemd-boot.enable = true;
  efi.canTouchEfiVariables = true;
};
boot.kernelModules = [ "snd-seq" "snd-rawmidi" ];

#Network Settings
networking = { 
  hostName = "nixos";
  networkmanager.enable = true;
  firewall.enable = true;
  #firewall.allowedUDPPorts = [ ... ];
  #..TCP.. = [ ... ];
};

#Sound
hardware.pulseaudio.enable = false;
services = {  
  pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
  };
  #jack = {
   # jackd.enable = true;
    #alsa.enable = false;
    #loopback.enable = true;
#  };
};

#Graphics
security.rtkit.enable = true;
hardware.graphics.enable = true;
hardware.graphics.extraPackages = [ pkgs.mesa.drivers ];

#Desktop
services.xserver = {
  enable = true;
  displayManager.gdm.enable = true;
  desktopManager.gnome.enable = true;
  #desktopManager.lxqt.enable = true;
  xkb.layout = "us";
};

#Other services
services.printing.enable = true;

#User settings


#Locale Stuff
i18n = {
  defaultLocale = "en_US.UTF-8";
  extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };
};

#Proprietary stuff
nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
  "spotify"
  "corefonts"
  "reaper"
  "renoise"
 ]; 

#Packages to exclude
environment.gnome.excludePackages = (with pkgs; [
  gnome-photos
  gnome-tour
  gnome-contacts
  gnome-weather
  epiphany # web browser
  geary # email reader
  tali # poker game
  iagno # go game
  hitori # sudoku game
  atomix # puzzle game
]);

#System Packages
environment.systemPackages = with pkgs; [
  vim
  wget
  rclone 
  gnome-tweaks 
  glxinfo #opengl stuff
  htop 
  git 
  flatpak #steam
  signal-desktop
  libreoffice-qt6-fresh
  spotify
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
  ardour
  zrythm
  reaper
  renoise
  qjackctl
  arduino
  mpv
  unityhub
];}
