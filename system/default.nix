###########
# VonixOS #
####################
# Default Profiles #
####################
{ lib, nur, vars, inputs, nixpkgs, nixneovim, home-manager, ... }:

let
 lib    = nixpkgs.lib;
 system = "x86_64-linux";
 pkgs = import nixpkgs {
   inherit system;
   config.allowUnfree = true;
   overlays = [ nixneovim.overlays.default ];
 };
in

{
 desktop = lib.nixosSystem {
   inherit system;
   specialArgs = {
     host = {
       hostName = "desktop";
     };
     inherit pkgs vars inputs system nixneovim;
   };
   modules = [
     ./desktop
     ./configuration.nix
     nur.nixosModules.nur
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
     };
     inherit pkgs vars inputs system nixneovim;
   };
   modules = [
     ./laptop
     ./configuration.nix
     nur.nixosModules.nur
     home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs   = true;
      home-manager.useUserPackages = true;
     }
   ];
 };
}
