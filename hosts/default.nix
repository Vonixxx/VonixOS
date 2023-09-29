###########
# VonixOS #
####################
# Default Profiles #
####################
{ lib, vars, inputs, nixpkgs, home-manager, plasma-manager, ... }:

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
   specialArgs = {
     inherit vars inputs system nixpkgs plasma-manager;
     host = {
       hostName = "desktop";
       mainMonitor = "HDMI-A-1";
     };
   };
   modules = [
     ./desktop
     ./configuration.nix

     home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs   = true;
      home-manager.useUserPackages = true;
     }
   ];
 };

 laptop = lib.nixosSystem {
   inherit system;
   specialArgs = {
     inherit vars inputs nixpkgs;
     host = {
       hostName = "laptop";
       mainMonitor = "eDP-1";
     };
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
