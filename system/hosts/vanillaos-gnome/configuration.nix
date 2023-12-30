###########
# VonixOS #
#######################################
# NixOS System-Specific Configuration #
#######################################
{ ... }:

{
 imports = ( 
   import ./characteristics      ++
   import ../../../modules/programs 
 );

 networking = {
   firewall.enable       = true;
   networkmanager.enable = true;
 };

 programs.bash.shellAliases.update = "sudo nix flake update 'github:Vonixxx/VonixOS' && sudo nixos-rebuild switch --no-write-lock-file --flake 'github:Vonixxx/VonixOS#vanillaos-gnome'";
}
