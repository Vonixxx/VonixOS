###########
# VonixOS #
#################################
# System-Specific Settings List #
#################################
{ ... }:

{
 imports = [
   ./characteristics/users/default.nix
   ./characteristics/packages/default.nix
   ./characteristics/configuration/default.nix
 ];
}
