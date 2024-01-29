###########
# VonixOS #
#########################
# AMD GPU Configuration #
#########################
{ lib, pkgs, config, ... }: with lib;

{
 config = mkIf (config.amdgpu.enable) {
   boot.kernelModules            = [ "amdgpu" ];
   hardware.opengl.extraPackages = with pkgs; [ amdvlk ];
 };
}
