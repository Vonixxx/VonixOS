###########
# VonixOS #
###########################
# Intel CPU Configuration #
###########################
{ ...
, lib
, config
}: 

with lib;
with config;

{
 config = mkIf (intelcpu.enable) {
   hardware.cpu.intel.updateMicrocode = true;
  
   boot = {
     initrd.kernelModules = [ "vmd" ];
     kernelModules        = [ "kvm-intel" ];
   };
 };
}
