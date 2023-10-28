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
     timeout = 10;
     efi = {
       canTouchEfiVariables = true;
       efiSysMountPoint     = "/boot";
     };
     grub = {
       configurationLimit = 5;
       enable             = true;
       efiSupport         = true;
       useOSProber        = true;
       devices            = [ "nodev" ];
     };
   };
   kernelPackages = pkgs.linuxPackages_latest;
 };
}
