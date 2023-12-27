###########
# VonixOS #
###################
# Default Profile #
###################
{ lib, nur, vars, inputs, nixpkgs, arkenfox, home-manager, unknown-vars, ... }:

let
 lib = nixpkgs.lib;

 pkgs = import nixpkgs {
   overlays = [ nur.overlay ];
   config   = { allowUnfree = false; }; 
 };
in { 
 default = lib.nixosSystem {
   modules = [
     ./machine
     ./version.nix
     ./packages.nix
     ./configuration.nix
     home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs   = true;
      home-manager.useUserPackages = true;
     }
   ];

   specialArgs = { inherit nur pkgs vars inputs arkenfox unknown-vars; };
 };
}
