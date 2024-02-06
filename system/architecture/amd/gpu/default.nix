###########
# VonixOS #
#########################
# AMD GPU Configuration #
#########################
{ lib, pkgs, config, ... }: 

with lib;
with pkgs;

{
 config = mkIf (config.amdgpu.enable) {
   hardware.opengl.extraPackages = [ amdvlk ];
   boot.kernelModules            = [ "amdgpu" ];
 };
}
