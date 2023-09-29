###########
# VonixOS #
#####################
# TLP Configuration #
#####################
{ config, pkgs, vars, lib, ... }:

{
 config = lib.mkIf ( config.laptop.enable ) {
   services = {
     tlp.enable = true;
     auto-cpufreq.enable = true;
   };
 };
}
