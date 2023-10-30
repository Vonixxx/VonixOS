###########
# VonixOS #
###################
# Desktop Profile #
###################
{ pkgs, vars, ... }:

{
 imports = [ 
  ./hardware-configuration.nix 
 ];

 gnome.enable = true;

 boot = {
   loader = {
     timeout = 5;
     systemd-boot = {
       configurationLimit = 5;
       enable             = true;
     };
     efi = {
       canTouchEfiVariables = true;
     };
   };
   kernelPackages = with pkgs; linuxPackages_latest;
 };
}
