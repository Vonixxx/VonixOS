###########
# VonixOS #
#########################
# AMD CPU Configuration #
#########################
{ lib, config, ... }: with lib;

{
 options.amdcpu.enable = mkOption {
   default = false;
   type    = types.bool;
 };

 config = mkIf (config.amdcpu.enable) {
   hardware.cpu.amd.updateMicrocode = true;
   boot.kernelModules               = [ "kvm-amd" ];
 };
}
