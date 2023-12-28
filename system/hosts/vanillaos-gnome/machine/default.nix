###########
# VonixOS #
#########################
# Machine Configuration #
#########################
{ pkgs, vars, ... }:

{
 imports = [ ./hardware-configuration.nix ];

 services = { 
   tlp.enable                   = true; 
   power-profiles-daemon.enable = false;
 };

 hardware.cpu.intel.updateMicrocode = true;
}
