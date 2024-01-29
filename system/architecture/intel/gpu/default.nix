###########
# VonixOS #
###########################
# Intel GPU Configuration #
###########################
{ lib, pkgs, config, ... }: with lib;

{
 config = mkIf (config.intelgpu.enable) {
   boot.kernelModules            = [ "i915" ];
   hardware.opengl.extraPackages = with pkgs; [ intel-media-driver ];
 };
}
