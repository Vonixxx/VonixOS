###########
# VonixOS #
#######################
# Flake Configuration #
#######################
# flake.nix
# └─/users
#    ├─/system 
#    │  ├─/environments
#    │  │  ├─/gnome
#    │  │  └─/hyprland
#    │  │
#    │  ├─/configuration
#    │  │  ├─/general
#    │  │  └─/architecture
#    │  │
#    │  └─/programs
#    │     ├─/generic
#    │     ├─/terminal
#    │     ├─/recording
#    │     └─/window-manager
#    │
#    └─/database/<type>/<brand>/<chosen host>
#       └─/characteristics
{
 inputs = {
   ##########################
   # Synchronizing Packages #
   ##########################
   home-manager.inputs.nixpkgs.follows = "nixpkgs";
   nixpkgs.follows                     = "nixHaskell/master";
   #########################
   # Official Repositories #
   #########################
   nixpkgs.url          = "github:nixos/nixpkgs/nixos-23.11";
   nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
   ##########################
   # Community Repositories #
   ##########################
   arkenfox.url     = "github:dwarfmaster/arkenfox-nixos";
   nixHaskell.url   = "github:input-output-hk/haskell.nix";
   home-manager.url = "github:nix-community/home-manager/release-23.11"; 
 };

 outputs = inputs @ { 
   self 
 , nixpkgs
 , arkenfox
 , nixHaskell
 , home-manager
 , nixpkgs-unstable
 , ... 
 }:
 { nixosConfigurations = (
     import ./users {
      inherit (nixpkgs) lib;
      inherit inputs nixpkgs arkenfox nixHaskell home-manager nixpkgs-unstable;
     }
   );
 };
}
