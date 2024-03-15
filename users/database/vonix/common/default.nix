###########
# VonixOS #
#################################
# System-Specific Settings List #
#################################
{ ... }:

{
 imports = [
   ./users/default.nix
   ./packages/default.nix
   ./bookmarks/default.nix
   ./configuration/default.nix
 ];
}
