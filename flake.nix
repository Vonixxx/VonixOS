###########
# VonixOS #
#######################
# Flake Configuration #
#######################
# flake.nix
# └─/users
#    ├─/system
#    │  ├─/programs
#    │  │
#    │  ├─/environments
#    │  │  ├─/gnome
#    │  │  └─/hyprland
#    │  │
#    │  └─/configuration
#    │     ├─/general
#    │     └─/architecture
#    │
#    └─/database/<type>/<brand>/<chosen host>
#       └─/characteristics
{
 inputs = {
   ##########################
   # Synchronizing Packages #
   ##########################
   disko.inputs.nixpkgs.follows        = "nixpkgs";
   home-manager.inputs.nixpkgs.follows = "nixpkgs";
   #########################
   # Official Repositories #
   #########################
   nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
   ##########################
   # Community Repositories #
   ##########################
   disko.url        = "github:nix-community/disko";
   arkenfox.url     = "github:dwarfmaster/arkenfox-nixos";
   home-manager.url = "github:nix-community/home-manager/release-23.11";
 };

 outputs = inputs @ {
   self 
 , disko
 , nixpkgs
 , arkenfox
 , home-manager
 , ...
 }:
 { nixosConfigurations = (
     import ./users {
      inherit (nixpkgs) lib;
      inherit disko inputs nixpkgs arkenfox home-manager;
     }
   );
 };
}
