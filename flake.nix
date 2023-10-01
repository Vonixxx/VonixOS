###########
# VonixOS #
#######################
# Flake Configuration #
#######################
{
 description = "NixOS + Flake Configuration for Laptop/Desktop";

 inputs = {
   nixpkgs = {
     url = "github:nixos/nixpkgs/nixos-unstable";
   };
   home-manager = {
     inputs.nixpkgs.follows = "nixpkgs";
     url                    = "github:nix-community/home-manager/master";
   };
 };

 outputs = inputs @ { self, nixpkgs, home-manager, ... }:
 let
  vars = {
    user          = "vonix";
    terminal      = "kitty";
    githubuser    = "Vonixxx";
    editor        = "spacevim";
    defaultlocale = "en_GB.UTF-8";
    extralocale   = "cs_CZ.UTF-8";
    swaycolors = {
      text             = "#FFFFFF";
      urgent           = "#BF616A";
      focusedborder    = "#B48EAD";
      unfocusedborder  = "#000000";
    };
    githubemail   = "vonixxxwork@tuta.io";
  };
 in {
   nixosConfigurations = (
     import ./hosts {
      inherit (nixpkgs) lib;
      inherit vars inputs nixpkgs home-manager;
     }
   );
 };
}
