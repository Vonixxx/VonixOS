###########
# VonixOS #
###########################
# Intel GPU Configuration #
###########################
{ pkgs, ... }:

{
 boot.kernelModules            = [ "i915" ];
 hardware.opengl.extraPackages = with pkgs; [ intel-media-driver ];
}
