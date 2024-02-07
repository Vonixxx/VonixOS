###########
# VonixOS #
######################################
# Environments/Programs/General List #
######################################
{ ... }:

{
 imports = [
   ./environments/gnome/default.nix
   ./environments/hyprland/default.nix

   ./programs/terminal/bat/default.nix
   ./programs/terminal/git/default.nix
   ./programs/terminal/lsd/default.nix
   ./programs/terminal/mpv/default.nix
   ./programs/terminal/zsh/default.nix
   ./programs/terminal/when/default.nix
   ./programs/terminal/foot/default.nix
   ./programs/terminal/helix/default.nix
   ./programs/terminal/sioyek/default.nix
   ./programs/generic/firefox/default.nix
   ./programs/window-manager/wofi/default.nix
   ./programs/window-manager/mako/default.nix
   ./programs/window-manager/cursor/default.nix
   ./programs/window-manager/waybar/default.nix
   ./programs/window-manager/wpaperd/default.nix
   ./programs/recording/kdenlive-obs/default.nix
   ./programs/window-manager/gammastep/default.nix

   ./configuration/general/default.nix
   ./configuration/architecture/amd/cpu/default.nix
   ./configuration/architecture/amd/gpu/default.nix
   ./configuration/architecture/intel/cpu/default.nix
   ./configuration/architecture/intel/gpu/default.nix
 ];
}
