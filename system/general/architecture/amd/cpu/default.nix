###########
# VonixOS #
#########################
# AMD CPU Configuration #
#########################
{ lib, config, ... }: with lib;

{
 config = mkIf (config.amdcpu.enable) {
   hardware.cpu.amd.updateMicrocode = true;
   boot.kernelModules               = [ "kvm-amd" ];
 };
}
