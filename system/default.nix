###########
# VonixOS #
###################
# Default Profile #
###################
{ lib, nur, vars, inputs, nixpkgs, arkenfox, home-manager, ... }:

let
 lib    = nixpkgs.lib;
 system = "x86_64-linux";

 pkgs = import nixpkgs {
   inherit system;
   overlays = [ nur.overlay ];
   config   = { allowUnfree = false; }; 
 };
in { 
 default = lib.nixosSystem {
   inherit system;
   modules = [
     ./machine
     ./configuration.nix
     home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs   = true;
      home-manager.useUserPackages = true;
     }
   ];

   specialArgs = { inherit nur pkgs vars inputs system arkenfox; };
 };
}
