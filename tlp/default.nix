###########
# VonixOS #
#####################
# TLP Configuration #
#####################
{ config, pkgs, ... }:


{
 #######
 # TLP #
 #######
 services.tlp = {
   enable = true;
   settings = {
     CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
     CPU_SCALING_GOVERNOR_ON_AC  = "performance";

     CPU_ENERGY_PERF_POLICY_ON_BAT = "powersave";
     CPU_ENERGY_PERF_POLICY_ON_AC  = "performance";
   };
 };
}
