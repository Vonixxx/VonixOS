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
 };
in

{
 desktop = lib.nixosSystem {
   inherit system;
   specialArgs = {
     host = {
       hostName = "desktop";
       mainMonitor = "HDMI-A-1";
     };
     inherit pkgs vars inputs system;
     overlays = [ nixneovim.overlays.default ];
   };
   modules = [
     ./desktop
     ./configuration.nix
     nixneovim.nixosModules.default
     home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs   = true;
      home-manager.useUserPackages = true;
     }
   ];
 };

 laptop = lib.nixosSystem {
   inherit system;
   specialArgs = {
     host = {
       hostName = "laptop";
       mainMonitor = "eDP-1";
     };
     inherit pkgs vars inputs system;
     overlays = [ nixneovim.overlays.default ];
   };
   modules = [
     ./laptop
     ./configuration.nix
     nixneovim.nixosModules.default
     home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs   = true;
      home-manager.useUserPackages = true;
     }
   ];
 };
}
