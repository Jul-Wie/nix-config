{ config, pkgs, lib, ... }:
{
imports =
  [ 
    ./hardware-configuration.nix
  ];
system.stateVersion = "23.11"; # never make anything other than 23.11
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

powerManagement.enable = true;
services.thermald.enable = true;
powerManagement.powertop.enable = true;

networking.hostName = "nixos";
networking.networkmanager.enable = true;
services.printing.enable = true;
networking.firewall.enable = true;
#networking.firewall.allowedUDPPorts = [ ... ];
#..TCP.. = [ ... ];

time.timeZone = "Europe/Amsterdam";
i18n.defaultLocale = "en_US.UTF-8";
i18n.extraLocaleSettings = {
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

hardware.opengl.enable = true;
hardware.opengl.extraPackages = [ pkgs.mesa.drivers ];
services.xserver = {
  enable = true;
  displayManager.gdm.enable = true;
  desktopManager.gnome.enable = true;
  libinput.enable = true;
  layout = "us";
  xkbVariant = "";
};
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
sound.enable = true;
hardware.pulseaudio.enable = false;
security.rtkit.enable = true;
services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
};

users.users.jul = {
  isNormalUser = true;
  description = "jul";
  extraGroups = [ "networkmanager" "wheel" ];
  packages = with pkgs; [
    librewolf
  ];
};

nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
  "assaultcube"
  "steam"
  "steam-original"
  "steam-run"
  "minecraft-launcher"
  ];
programs.steam = {
  enable = true;
  dedicatedServer.openFirewall = true;
};
environment.systemPackages = with pkgs; [
  vim
  wget
  zeroad
  assaultcube
  rclone 
  gnome3.gnome-tweaks 
  glxinfo
  element-desktop 
  htop 
  antsimulator
  minecraft
  git 
 ];}
