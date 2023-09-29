###########
# VonixOS #
###################
# Desktop Profile #
###################
{ lib, pkgs, vars, ... }:

{
 imports = [ ./hardware-configuration.nix ]

 kde.enable     = true;
 desktop.enable = true;

 boot = {
   loader = {
     timeout = 3;
     efi = {
       canTouchEfiVariables = true;
       efiSysMountPoint     = "/boot";
     };
     grub = {
       configurationLimit = 3;
       enable             = true;
       efiSupport         = true;
       useOSProber        = true;
       devices            = [ "nodev" ];
     };
   };
 };

 hardware = {
   opengl = {
     enable = true;
     extraPackages = with pkgs; [
       vaapiVdpau
       libvdpau-va-gl
     ];
   };
 };
}
