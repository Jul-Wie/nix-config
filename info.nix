{ config, pkgs, lib, ... }:{
 users.users.jul = {
    isNormalUser = true;
    description = "jul";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };
}
