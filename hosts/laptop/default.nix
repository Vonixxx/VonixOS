###########
# VonixOS #
##################
# Laptop Profile #
##################
{ pkgs, vars, ... }:

{
 imports = [
   ./hardware-configuration.nix
 ];

 sway.enable           = true;
 laptop.enable         = true;
 programs.light.enable = true;

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

 systemd.tmpfiles.rules = [
   "d /var/lib/bluetooth 700 root root - -"
 ];
 systemd.targets."bluetooth".after = ["systemd-tmpfiles-setup.service"];
}
