###########
# VonixOS #
####################
# Default Profiles #
####################
{ lib, vars, inputs, nixpkgs, home-manager, ... }:

let
 lib = nixpkgs.lib;
 system = "x86_64-linux";
 pkgs = import nixpkgs {
   inherit system;
   config.allowUnfree = true;
 };
in
{
 desktop = lib.nixosSystem {
   inherit system;
   modules = [
     ./desktop
     ./configuration.nix
     home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs   = true;
      home-manager.useUserPackages = true;
     }
   ];
   specialArgs = {
     host = {
       hostName = "desktop";
       mainMonitor = "HDMI-A-1";
     };
     inherit vars inputs system nixpkgs;
   };
 };

 laptop = lib.nixosSystem {
   inherit system;
   specialArgs = {
     host = {
       hostName = "laptop";
       mainMonitor = "eDP-1";
     };
     inherit vars inputs system  nixpkgs;
   };
   modules = [
     ./laptop
     ./configuration.nix
     home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs   = true;
      home-manager.useUserPackages = true;
     }
   ];
 };
}
