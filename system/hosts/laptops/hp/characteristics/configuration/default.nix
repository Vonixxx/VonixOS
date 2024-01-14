###########
# VonixOS #
#######################################
# System-Specific NixOS Configuration #
#######################################
{ ... }:

{
 gnome.enable                      = true;
 services.xserver.layout           = "cz"; 
 programs.bash.shellAliases.update = "sudo nix flake update 'github:Vonixxx/VonixOS' && sudo nixos-rebuild switch --no-write-lock-file --flake 'github:Vonixxx/VonixOS#hp' --impure";
}
