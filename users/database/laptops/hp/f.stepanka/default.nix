###########
# VonixOS #
#################################
# System-Specific Settings List #
#################################
{ ... }:

{
 imports = [
   ./users/default.nix
   ./bookmarks/default.nix
   ./configuration/default.nix
 ];
}
