###########
# VonixOS #
###################
# Desktop Profile #
###################
{ pkgs, ... }:

{
 imports = [ 
  ./hardware-configuration.nix 
];

 kde.enable     = true;
 desktop.enable = true;

 hardware = {
   opengl = {
     enable = true;
     extraPackages = with pkgs; [
       vaapiVdpau
       libvdpau-va-gl
     ];
   };
 };

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
}
