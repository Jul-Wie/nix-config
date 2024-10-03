{ config, pkgs, lib, ... }:
{ 
imports =
  [ 
    ./hardware-configuration.nix
  ];
system.stateVersion = "24.05"; # never make anything other than 24.05
#  conf-pkg-config = super.conf-pkg-config.overrideAttrs (oldAttrs: {
#    propagatedBuildInputs = [ pkgs.pkg-config ];
#    propagatedNativeBuildInputs = [ pkgs.pkg-config ];
#  }); 
boot.loader = {
  systemd-boot.enable = true;
  efi.canTouchEfiVariables = true;
};

powerManagement = {
  enable = true;
  powertop.enable = true;
};

networking = { 
  hostName = "nixos";
  networkmanager.enable = true;
  firewall.enable = true;
  #firewall.allowedUDPPorts = [ ... ];
  #..TCP.. = [ ... ];
};

time.timeZone = "Europe/Amsterdam";
i18n = {
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
  defaultLocale = "en_US.UTF-8";
};

hardware = {
  pulseaudio.enable = false;
  opengl = {
    enable = true;
    extraPackages = [ pkgs.mesa.drivers ];
  };  
};

sound.enable = true;
security.rtkit.enable = true;

services = {
  xserver = { enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    xkb.layout = "us";
  };
  pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  libinput.enable = true;
  printing.enable = true;
  thermald.enable = true;
};
    
nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      # Add additional package names here
      "spotify"
    ];   
      


#windowManager.awesome = {      
#enable = true;      
#package = pkgs.awesome.overrideAttrs (old: {        
#src = pkgs.fetchFromGitHub {      	  
#owner = "awesomeWM";      	  
#repo = "awesome";      	  rev = "392dbc2";      	  
#sha256 = "sha256:093zapjm1z33sr7rp895kplw91qb8lq74qwc0x1ljz28xfsbp496";         }; 
environment.gnome.excludePackages = (with pkgs; [
  gnome-photos
  gnome-tour
]) 
++ (with pkgs.gnome; [
  gnome-contacts
  gnome-weather
  epiphany # web browser
  geary # email reader
  tali # poker game
  iagno # go game
  hitori # sudoku game
  atomix # puzzle game
]);


users.users.julios = {
  isNormalUser = true;
  description = "julios";
  extraGroups = [ "networkmanager" "wheel" ];
  packages = with pkgs; [
    librewolf
];
};
environment.systemPackages = with pkgs; [
  vim
  wget
  rclone 
  gnome3.gnome-tweaks 
  glxinfo
  htop 
  git 
  flatpak
  signal-desktop
  libreoffice-qt6-fresh
  amberol
  spotify
  killall
  protonvpn-gui
  flutter
  findutils
  picom
  rofi
  arduino-ide
  emacs
  calibre
  cartridges
  neofetch
  screenfetch
  inetutils
  ocs-url
  lshw
  chromium
  usbutils
  unzip
  arduino
  genymotion
];}
