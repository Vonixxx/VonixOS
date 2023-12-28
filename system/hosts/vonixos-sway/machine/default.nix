###########
# VonixOS #
#########################
# Machine Configuration #
#########################
{ ... }:

{
 imports = [ ./hardware-configuration.nix ];

 services.tlp.settings = {
   enable              = true;
   auto-cpufreq.enable = true;
 };

 hardware.cpu.amd.updateMicrocode = true;
}
