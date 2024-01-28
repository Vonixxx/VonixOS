###########
# VonixOS #
###########################
# Intel CPU Configuration #
###########################
{ ... }:

{
 options.intelcpu.enable = mkOption {
   default = false;
   type    = types.bool;
 };

 config = mkIf (config.intelcpu.enable) {
   hardware.cpu.intel.updateMicrocode = true;
  
   boot = {
     initrd.kernelModules = [ "vmd" ];
     kernelModules        = [ "kvm-intel" ];
   };
 };
}
