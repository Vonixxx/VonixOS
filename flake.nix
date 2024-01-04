###########
# VonixOS #
#######################
# Flake Configuration #
#######################
# flake.nix
# ├─/variables
# └─/system
#    └─default.nix
#      ├─general-configuration.nix      
#      └─/hosts/<chosen host>
#         └─configuration.nix
#           ├─/characteristics          
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
   nur.url              = "github:nix-community/NUR";
   nixpkgs-stable.url   = "github:nixos/nixpkgs/nixos-23.11";
   home-manager.url     = "github:nix-community/home-manager"; 
   arkenfox.url         = "github:dwarfmaster/arkenfox-nixos";
   nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
 };

 outputs = inputs @ { nur, self, arkenfox, home-manager, nixpkgs-stable, nixpkgs-unstable, ... }:

 let
  vars         = import ./variables/known.nix;
  unknown-vars = import ./variables/unknown.nix;
 in {
   nixosConfigurations = (
     import ./system {
      inherit (nixpkgs) lib;
      inherit nur vars inputs arkenfox home-manager unknown-vars nixpkgs-stable nixpkgs-unstable;
     }
   );
 };
}
