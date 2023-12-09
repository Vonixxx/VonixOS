###########
# VonixOS #
#########################
# Machine Configuration #
#########################
{ pkgs, vars, ... }:

{
 imports = [ ./hardware-configuration.nix ];

 sway.enable = true;

 programs.light.enable = true;

 services.tlp.settings = {
   enable              = true;
   auto-cpufreq.enable = true;
 };

 boot.loader = {
   timeout = 5;

   systemd-boot = {
     configurationLimit = 5;
     enable             = true;
   };

   efi = { canTouchEfiVariables = true; };
 };
}
