###########
# VonixOS #
###########################
# Intel GPU Configuration #
###########################
{ lib, pkgs, config, ... }: 

with lib;
with pkgs;

{
 config = mkIf (config.intelgpu.enable) {
   boot.kernelModules            = [ "i915" ];
   hardware.opengl.extraPackages = [ intel-media-driver ];
 };
}
