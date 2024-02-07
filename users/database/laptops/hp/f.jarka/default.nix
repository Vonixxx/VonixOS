###########
# VonixOS #
#################################
# System-Specific Settings List #
#################################
{ ... }:

{
 imports = [
   ./characteristics/users/default.nix
   ./characteristics/hardware/default.nix
   ./characteristics/packages/default.nix
   ./characteristics/bookmarks/default.nix
   ./characteristics/configuration/default.nix
 ];
}
