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
 laptop.enable = true;

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
