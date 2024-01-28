###########
# VonixOS #
#################
# Programs List #
#################
{ lib, config, ... }: with lib;

{
 options = {
   generic.enable = mkOption {
     default = false;
     type    = types.bool;
   };

   terminal.enable = mkOption {
     default = false;
     type    = types.bool;
   };

   recording.enable = mkOption {
     default = false;
     type    = types.bool;
   };

   window-manager.enable = mkOption {
     default = false;
     type    = types.bool;
   };
 };

 config = mkIf (config.terminal.enable) {
   [
    ./terminal/bat/default.nix
    ./terminal/git/default.nix
    ./terminal/mpv/default.nix
    ./terminal/lsd/default.nix
    ./terminal/zsh/default.nix
    ./terminal/foot/default.nix
    ./terminal/helix/default.nix
    ./terminal/sioyek/default.nix
   ]
 };

 config = mkIf (config.generic.enable) {
   [
    ./generic/firefox/default.nix
   ]
 };

 config = mkIf (config.recording.enable) {
   [
    ./recording/kdenlive-obs/default.nix
   ]
 };

 config = mkIf (config.window-manager.enable) {
   [
    ./window-manager/mako/default.nix
    ./window-manager/wofi/default.nix
    ./window-manager/cursor/default.nix
    ./window-manager/waybar/default.nix
    ./window-manager/wpaperd/default.nix
    ./window-manager/gammastep/default.nix
   ]
 };
}
