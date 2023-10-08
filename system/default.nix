###########
# VonixOS #
####################
# Default Profiles #
####################
{ lib, vars, inputs, nixpkgs, nixneovim, home-manager, ... }:

let
 lib    = nixpkgs.lib;
 system = "x86_64-linux";
 pkgs = import nixpkgs {
   inherit system;
   config.allowUnfree = true;
   overlays           = [ nixneovim.overlays.default ];
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
     nixneovim.nixosModules.default
   ];
   specialArgs = {
     host = {
       hostName = "desktop";
       mainMonitor = "HDMI-A-1";
     };
     inherit pkgs vars inputs system;
   };
 };

 laptop = lib.nixosSystem {
   inherit system;
   specialArgs = {
     host = {
       hostName = "laptop";
       mainMonitor = "eDP-1";
     };
     inherit pkgs vars inputs system;
   };
   modules = [
     ./laptop
     ./configuration.nix
     home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs   = true;
      home-manager.useUserPackages = true;
     }
     nixneovim.nixosModules.default
   ];
 };
}
