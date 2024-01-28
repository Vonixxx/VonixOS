###########
# VonixOS #
#########################
# AMD GPU Configuration #
#########################
{ pkgs, ... }:

{
 options.amdgpu.enable = mkOption {
   default = false;
   type    = types.bool;
 };

 config = mkIf (config.amdgpu.enable) {
   boot.kernelModules            = [ "amdgpu" ];
   hardware.opengl.extraPackages = with pkgs; [ amdvlk ];
 };
}
