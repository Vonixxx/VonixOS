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
   home-manager.inputs.nixpkgs.follows = "nixpkgs-stable";
   #########################
   # Official Repositories #
   #########################
   nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
   ##########################
   # Community Repositories #
   ##########################
   nur.url          = "github:nix-community/NUR";
   arkenfox.url     = "github:dwarfmaster/arkenfox-nixos";
   home-manager.url = "github:nix-community/home-manager/release-23.11"; 
 };

 outputs = inputs @ { nur, self, arkenfox, home-manager, nixpkgs-stable, ... }: {
   nixosConfigurations = (
     import ./system {
      inherit (nixpkgs-stable) lib;
      inherit nur inputs arkenfox home-manager nixpkgs-stable;
     }
   );
 };
}
