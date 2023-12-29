###########
# VonixOS #
#######################
# Flake Configuration #
#######################
# flake.nix
# ├─/variables
# └─/system
#    └─default.nix
#      └─/hosts/<chosen host>
#         └─configuration.nix
#           └─/modules
#              ├─/programs
#              │   └─default.nix
#              ├─/programs-wm
#              │   └─default.nix
#              └─/terminal
#                  └─default.nix
{
 description = "Flake Configuration - Sway";

 inputs = {
   ##########################
   # Synchronizing Packages #
   ##########################
   home-manager.inputs.nixpkgs.follows = "nixpkgs";
   ###################
   # Repository URLs #
   ###################
   nur.url          = "github:nix-community/NUR";
   home-manager.url = "github:nix-community/home-manager"; 
   arkenfox.url     = "github:dwarfmaster/arkenfox-nixos";
   nixpkgs.url      = "github:nixos/nixpkgs/nixos-unstable";
 };

 outputs = inputs @ { nur, self, nixpkgs, arkenfox, home-manager, ... }:

 let
  vars         = import ./variables/known.nix;
  unknown-vars = import ./variables/unknown.nix;
 in {
   nixosConfigurations = (
     import ./system {
      inherit (nixpkgs) lib;
      inherit nur vars inputs nixpkgs arkenfox home-manager unknown-vars;
     }
   );
 };
}
