###########
# VonixOS #
###########################
# Intel GPU Configuration #
###########################
{ lib
, pkgs
, config 
}: 

with lib;
with pkgs;
with config;

{
 config = mkIf (intelgpu.enable) {
   boot.kernelModules            = [ "i915" ];
   hardware.opengl.extraPackages = [ intel-media-driver ];
 };
}
