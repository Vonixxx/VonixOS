###########
# VonixOS #
#######################
# Flake Configuration #
#######################
# flake.nix
# ├─/variables
# └─/system
#    └─default.nix
#      ├─configuration.nix      
#      └─/hosts/<chosen host>
#         └─configuration.nix
#           ├─/characteristics          
#           └─/modules
#              ├─/environments
#              │  └─default.nix
#              ├─/terminal
#              │  └─default.nix
#              └─/programs
#                 ├─generic.nix
#                 ├─recording.nix
#                 └─window-manager.nix
{
 description = "Flake Configuration - Sway";

 inputs = {
   ##########################
   # Synchronizing Packages #
   ##########################
   home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
   #########################
   # Official Repositories #
   #########################
   nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
   ##########################
   # Community Repositories #
   ##########################
   nur.url          = "github:nix-community/NUR";
   arkenfox.url     = "github:dwarfmaster/arkenfox-nixos";
   home-manager.url = "github:nix-community/home-manager/master"; 
 };

 outputs = inputs @ { nur, self, arkenfox, home-manager, nixpkgs-unstable, ... }:

 let
  vars         = import ./variables/known.nix;
  unknown-vars = import ./variables/unknown.nix;
 in {
   nixosConfigurations = (
     import ./system {
      inherit (nixpkgs-unstable) lib;
      inherit nur vars inputs arkenfox home-manager unknown-vars nixpkgs-unstable;
     }
   );
 };
}
