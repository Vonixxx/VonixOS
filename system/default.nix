###########
# VonixOS #
######################################
# Environments/Programs/General List #
######################################
{ ... }:

{
 imports = [
   ./general/configuration/default.nix
   ./general/architecture/amd/cpu/default.nix
   ./general/architecture/amd/gpu/default.nix
   ./general/architecture/intel/cpu/default.nix
   ./general/architecture/intel/gpu/default.nix

   ./modules/environments/gnome/default.nix
   ./modules/environments/hyprland/default.nix
   ./modules/programs/terminal/bat/default.nix
   ./modules/programs/terminal/git/default.nix
   ./modules/programs/terminal/lsd/default.nix
   ./modules/programs/terminal/mpv/default.nix
   ./modules/programs/terminal/zsh/default.nix
   ./modules/programs/terminal/foot/default.nix
   ./modules/programs/terminal/helix/default.nix
   ./modules/programs/terminal/sioyek/default.nix
   ./modules/programs/generic/firefox/default.nix
   ./modules/programs/window-manager/wofi/default.nix
   ./modules/programs/window-manager/mako/default.nix
   ./modules/programs/window-manager/cursor/default.nix
   ./modules/programs/window-manager/waybar/default.nix
   ./modules/programs/window-manager/wpaperd/default.nix
   ./modules/programs/recording/kdenlive-obs/default.nix
   ./modules/programs/window-manager/gammastep/default.nix
 ];
}
