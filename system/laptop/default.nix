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

 programs.light.enable = true;

 services = {
   tlp.settings = {
     enable              = true;
     auto-cpufreq.enable = true;
   };
 };

 boot = {
   loader = {
     timeout = 5;
     systemd-boot = {
       enable = true;
       configurationLimit = 5;
     };
     efi = {
       canTouchEfiVariables = true;
     };
   };
 };

 ${vars.userInterface}.enable = true;
}
