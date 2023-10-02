###########
# VonixOS #
#######################
# Flake Configuration #
#######################
# flake.nix
# └─./system
#     └─default.nix
#       ├─<host> # Laptop or Desktop
#       └─configuration.nix
#         └─./modules
#             ├─./desktops
#             │   └─default.nix
#             └─./terminal
#                 └─default.nix
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
    githubemail   = "vonixxxwork@tuta.io";
    password      = "$6$2apmrKDHbo.NXO.l$R8rgwCFVrbnU5rJDgtb2qMFcbPFqCAdDkm2Mn8sVU.gw9YMGu9oBXZTLdyiybKaiOXaKxdPDeGhQpzccwn93D1";
    swaycolors = {
      text             = "#FFFFFF";
      urgent           = "#BF616A";
      focusedborder    = "#B48EAD";
      unfocusedborder  = "#000000";
    };
  };
 in {
   nixosConfigurations = (
     import ./system {
      inherit (nixpkgs) lib;
      inherit vars inputs nixpkgs home-manager;
     }
   );
 };
}
