###########
# VonixOS #
#######################################
# NixOS System-Specific Configuration #
#######################################
{ ... }:

{
 services.xserver.layout           = "cz";
 gnome.enable                      = true;
 networking.networkmanager.enable  = true; 
 programs.bash.shellAliases.update = "sudo nix flake update 'github:Vonixxx/VonixOS' && sudo nixos-rebuild switch --no-write-lock-file --flake 'github:Vonixxx/VonixOS#laptop-hp' --impure";
}
