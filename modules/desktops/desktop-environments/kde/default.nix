###########
# VonixOS #
############################
# KDE Plasma Configuration #
############################
{ lib, pkgs, vars, config, ... }:

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
   desktop.enable = true;


   home-manager.users.${vars.user} = {
     programs.plasma = {
       enable = true;
     };
   };

   services = {
     xserver = {
       enable          = true;
       libinput.enable = true;
       layout          = "us";
       desktopManager.plasma5 = {
         enable = true;
       };
       displayManager = {
         sddm.enable    = true;
         defaultSession = "plasmawayland";
       };
     };
   };
 };
}
