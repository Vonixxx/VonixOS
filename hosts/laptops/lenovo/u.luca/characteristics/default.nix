###########
# VonixOS #
#################################
# System-Specific Settings List #
#################################
{ ... }:

{
imports = [
 ./users/default.nix
 ./hardware/default.nix
 ./packages/default.nix
 ./bookmarks/default.nix
 ./configuration/default.nix
];
}
