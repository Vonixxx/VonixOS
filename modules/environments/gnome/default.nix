###########
# VonixOS #
#######################
# Gnome Configuration #
#######################
{ lib, config, ... }: with lib;

{
 options.gnome.enable = mkOption {
   default = false;
   type    = types.bool;
 };

 config = mkIf (config.gnome.enable) {
   services.xserver.desktopManager.gnome.enable = true;
 };
}
