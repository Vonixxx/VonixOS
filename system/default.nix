###########
# VonixOS #
###############################################
# Environments/Programs/Configuration Imports #
###############################################
{ ... }:

{
 imports = [
   ./programs/bat/default.nix
   ./programs/git/default.nix
   ./programs/lsd/default.nix
   ./programs/mpv/default.nix
   ./programs/zsh/default.nix
   ./programs/foot/default.nix
   ./programs/mako/default.nix
   ./programs/wofi/default.nix
   ./programs/atuin/default.nix
   ./programs/helix/default.nix
   ./programs/waybar/default.nix
   ./programs/firefox/default.nix
   ./programs/joshuto/default.nix
   ./programs/wpaperd/default.nix
   ./programs/printing/default.nix
   ./programs/gammastep/default.nix
   ./programs/kdenlive-obs/default.nix
   ./programs/transmission/default.nix

   ./environments/gnome/default.nix
   ./environments/hyprland/default.nix

   ./configuration/disk/default.nix
   ./configuration/general/default.nix
   ./configuration/options/default.nix
   ./configuration/arch/amd/cpu/default.nix
   ./configuration/arch/amd/gpu/default.nix
   ./configuration/arch/intel/cpu/default.nix
   ./configuration/arch/intel/gpu/default.nix
 ];
}
