###########
# VonixOS #
#######################################
# NixOS System-Specific Configuration #
#######################################
{ ... }:

{
 imports = ( 
   import ./characteristics               ++
   import ../../../modules/programs       ++
   import ../../../modules/programs-optional 
 );

 hardware.pulseaudio.enable = false;

 networking.networkmanager.enable = true; 

 environment.variables = { LIBGL_ALWAYS_SOFTWARE = 1; };

 programs.bash.shellAliases.update = "sudo nix flake update 'github:Vonixxx/VonixOS' && sudo nixos-rebuild switch --no-write-lock-file --flake 'github:Vonixxx/VonixOS#gnome' --impure";
}
