###########
# VonixOS #
#########################
# AMD GPU Configuration #
#########################
{ lib
, pkgs
, config 
, ...
}: 

with lib;
with pkgs;
with config;

{
 config = mkIf (amdgpu.enable) {
   hardware.opengl.extraPackages = [ amdvlk ];
   boot.kernelModules            = [ "amdgpu" ];
 };
}
