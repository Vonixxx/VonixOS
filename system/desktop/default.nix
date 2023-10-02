###########
# VonixOS #
###################
# Desktop Profile #
###################
# flake.nix
# ├─ ./hosts
# │   ├─ default.nix
# │   └─ ./desktop
# │        ├─ default.nix *
# │        └─ hardware-configuration.nix
# └─ ./modules
#      └─ ./desktops
#          ├─ hyprland.nix
#          └─ ./virtualisation
#              └─ default.nix
#
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
