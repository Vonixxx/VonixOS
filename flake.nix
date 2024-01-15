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
 description = "Flake Configuration";

 inputs = {
   ##########################
   # Synchronizing Packages #
   ##########################
   home-manager.inputs.nixpkgs.follows = "stable";
   #########################
   # Official Repositories #
   #########################
   stable.url = "github:nixos/nixpkgs/nixos-23.11";
   ##########################
   # Community Repositories #
   ##########################
   arkenfox.url     = "github:dwarfmaster/arkenfox-nixos";
   home-manager.url = "github:nix-community/home-manager/release-23.11"; 
 };

 outputs = inputs @ { self, stable, arkenfox, home-manager, ... }: {
   nixosConfigurations = (
     import ./system {
      inherit (stable) lib;
      inherit inputs stable arkenfox home-manager;
     }
   );
 };
}
