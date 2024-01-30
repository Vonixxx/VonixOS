###########
# VonixOS #
#######################
# Flake Configuration #
#######################
# flake.nix
# └─/hosts
#    └─default.nix
#      └─/hosts/<type>/<brand>/<chosen host>
#         └─imports.nix
#           ├─/modules 
#           │  ├─/programs
#           │  └─/environments
#           └─/system
#              ├─/architecture
#              └─/general-configuration
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
     import ./hosts {
      imports = [
        home-manager.nixosModules.home-manager
      ];
      inherit (nixpkgs) lib;
      inherit inputs nixpkgs arkenfox home-manager;
     }
   );
 };
}
