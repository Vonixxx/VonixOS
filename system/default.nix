###########
# VonixOS #
####################
# Default Profiles #
####################
{ lib, nur, vars, inputs, nixpkgs, home-manager, ... }:

let
 lib    = nixpkgs.lib;
 system = "x86_64-linux";
 pkgs = import nixpkgs {
   inherit system;
   overlays = [ nur.overlay ];
   config   = { allowUnfree = true; }; 
 };
in { 
 window-manager = lib.nixosSystem {
   inherit system;
   specialArgs = {
     host = {
       hostName = "machine";
     };
     inherit nur pkgs vars inputs system;
   };
   modules = [
     ./machine
     ./configuration.nix
     home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs   = true;
      home-manager.useUserPackages = true;
     }
   ];
 };
}
