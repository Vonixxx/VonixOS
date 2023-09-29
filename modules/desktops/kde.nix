###########
# VonixOS #
##############################
# KDE Plasma-5 Configuration #
##############################
{ config, lib, pkgs, vars, ... }:

with lib;
{
 options = {
   kde = {
     enable = mkOption {
       default = false;
       type    = types.bool;
     };
   };
 };

 config = mkIf (config.kde.enable) {
  services = {
    xserver = {
      enable          = true;
      layout          = "us";
      libinput.enable = true;
      desktopManager.plasma5 = {
        enable = true;
      };
      displayManager = {
        sddm.enable    = true;
        defaultSession = "plasmawayland";
      };
    };
  };

   home-manager.users.${vars.user} = {
     programs.plasma = {
       enable = true;
     };
   };
 };
}
