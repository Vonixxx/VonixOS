###########
# VonixOS #
#######################################
# System-Specific NixOS Configuration #
#######################################
{ ... }:

{
 services = { 
   xserver.layout               = "cz"; 
   tlp.enable                   = true; 
   power-profiles-daemon.enable = false;
 };

 gnome.enable                      = true;
 networking.networkmanager.enable  = true; 
 programs.bash.shellAliases.update = "sudo nix flake update 'github:Vonixxx/VonixOS' && sudo nixos-rebuild switch --no-write-lock-file --flake 'github:Vonixxx/VonixOS#laptop-hp' --impure";
}
