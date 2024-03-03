###########
# VonixOS #
#################################
# System-Specific Settings List #
#################################
{ ... }:

{
 imports = [
   ./characteristics/users/default.nix
   ./characteristics/bookmarks/default.nix
   ./characteristics/configuration/default.nix
 ];
}
