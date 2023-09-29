###########
# VonixOS #
###################
# Desktop Profile #
###################
{ lib, pkgs, vars, ... }:

{
 imports = [ ./hardware-configuration.nix ]

 boot = {
   loader = {
     timeout = 5;
     systemd-boot = {
       enable = true;
       configurationLimit = 3;
     };
     efi = {
       canTouchEfiVariables = true;
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

 sway.enable = true;
}
