###########
# VonixOS #
#########################
# AMD CPU Configuration #
#########################
{ lib
, config 
, ...
}: 

with lib;
with config;

{
 config = mkIf (amdcpu.enable) {
   hardware.cpu.amd.updateMicrocode = true;
   boot.kernelModules               = [ "kvm-amd" ];
 };
}
