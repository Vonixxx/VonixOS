###########
# VonixOS #
#########################
# AMD CPU Configuration #
#########################
{ ... }:

{
 hardware.cpu.amd.updateMicrocode = true;
 boot.kernelModules               = [ "kvm-amd" ];
}
