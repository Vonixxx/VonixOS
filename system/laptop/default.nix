###########
# VonixOS #
##################
# Laptop Profile #
##################
{ pkgs, ... }:

{
 imports = [
   ./hardware-configuration.nix
 ];

 sway.enable   = true;

 boot = {
   loader = {
     timeout = 3;
     systemd-boot = {
       enable = true;
       configurationLimit = 3;
     };
     efi = {
       canTouchEfiVariables = true;
     };
   };
 };
}
