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
   plasma-manager = {
     inputs.nixpkgs.follows      = "nixpkgs";
     inputs.home-manager.follows = "nixpkgs";
     url                         = "github:pjones/plasma-manager";
   };
   home-manager = {
     inputs.nixpkgs.follows = "nixpkgs";
     url                    = "github:nix-community/home-manager/release-23.05";
   };
 };

 outputs = inputs @ { self, nixpkgs, home-manager, plasma-manager, ... }:
 let
  vars = {
    editor   = "nvim";
    user     = "vonix";
    terminal = "kitty";
    swaycolors = {
      white   = "#FFFFFF";
      base    = "#0C090A";
      black   = "#000000";
      overlay = "#F88017";
    };
  };
 in {
   nixosConfigurations = (
     import ./hosts {
      inherit (nixpkgs) lib;
      inherit vars inputs nixpkgs home-manager plasma-manager;
     }
   );
 };
}
