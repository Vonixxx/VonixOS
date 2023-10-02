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

 budgie.enable  = true;

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
