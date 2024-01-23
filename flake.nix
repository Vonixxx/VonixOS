###########
# VonixOS #
#######################
# Flake Configuration #
#######################
# flake.nix
# └─/system
#    └─default.nix
#      ├─configuration.nix      
#      └─/hosts/<chosen host>
#         └─imports.nix
#           ├─/characteristics          
#           └─/modules
#              ├─/environments
#              │  └─default.nix
#              └─/programs
#                 ├─generic.nix
#                 ├─terminal.nix
#                 ├─recording.nix
#                 └─window-manager.nix
{
 description = "Flake Configuration";

 inputs = {
   ##########################
   # Synchronizing Packages #
   ##########################
   home-manager.inputs.nixpkgs.follows = "nixpkgs";
   #########################
   # Official Repositories #
   #########################
   nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
   ##########################
   # Community Repositories #
   ##########################
   arkenfox.url     = "github:dwarfmaster/arkenfox-nixos";
   home-manager.url = "github:nix-community/home-manager/release-23.11"; 
 };

 outputs = inputs @ { self, nixpkgs, arkenfox, home-manager, ... }: {
   nixosConfigurations = (
     import ./system {
      inherit (nixpkgs) lib;
      inherit inputs nixpkgs arkenfox home-manager;
     }
   );
 };
}
