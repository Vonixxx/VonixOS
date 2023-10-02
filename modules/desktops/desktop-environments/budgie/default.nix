###########
# VonixOS #
########################
# Budgie Configuration #
########################
{ lib, pkgs, vars, config, ... }:

with lib;
{
 options = {
   budgie = {
     enable = mkOption {
       default = false;
       type    = types.bool;
     };
   };
 };

 config = mkIf (config.budgie.enable) {
   services = {
     xserver = {
       enable          = true;
       libinput.enable = true;
       layout          = "us";
       desktopManager.budgie = {
         enable = true;
       };
       displayManager.lightdm = {
         enable = true;
       };
     };
   };
 };
}
