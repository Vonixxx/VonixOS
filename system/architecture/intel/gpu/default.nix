###########
# VonixOS #
###########################
# Intel GPU Configuration #
###########################
{ lib, pkgs, config, ... }: with lib;

{
 options.intelgpu.enable = mkOption {
   default = false;
   type    = types.bool;
 };

 config = mkIf (config.intelgpu.enable) {
   boot.kernelModules            = [ "i915" ];
   hardware.opengl.extraPackages = with pkgs; [ intel-media-driver ];
 };
}
