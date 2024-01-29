###########
# VonixOS #
#########################
# Hardware Combinations #
#########################
{ ... }:

{
imports = [
 ./general-configuration/default.nix

 ./architecture/amd/cpu/default.nix
 ./architecture/amd/gpu/default.nix
 ./architecture/intel/cpu/default.nix
 ./architecture/intel/gpu/default.nix
];
}
