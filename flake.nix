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

 outputs = inputs @ { 
   self 
 , nixpkgs
 , arkenfox
 , home-manager
 , ... 
 }: 
 { 
   nixosConfigurations = (
     import ./users {
      inherit (nixpkgs) lib;
      inherit inputs nixpkgs arkenfox home-manager;
     }
   );
 };
}
