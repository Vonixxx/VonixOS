###########
# VonixOS #
###########################
# Intel CPU Configuration #
###########################
{ ... }:

{
 hardware.cpu.intel.updateMicrocode = true;

 boot = {
   initrd.kernelModules = [ "vmd" ];
   kernelModules        = [ "kvm-intel" ];
 };
}
