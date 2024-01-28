###########
# VonixOS #
#########################
# AMD GPU Configuration #
#########################
{ pkgs, ... }:

{
 boot.kernelModules            = [ "amdgpu" ];
 hardware.opengl.extraPackages = with pkgs; [ amdvlk ];
}
