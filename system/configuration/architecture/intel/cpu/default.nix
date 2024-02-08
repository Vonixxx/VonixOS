###########
# VonixOS #
###########################
# Intel CPU Configuration #
###########################
{ lib
, config
, ...
}: 

with lib;

{
 config = mkIf (config.intelcpu.enable) {
   hardware.cpu.intel.updateMicrocode = true;
  
   boot = {
     initrd.kernelModules = [ "vmd" ];
     kernelModules        = [ "kvm-intel" ];
   };
 };
}
