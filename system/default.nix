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
   overlays = [ 
     nur.overlay
     nixneovim.overlays.default 
   ];
   config = {
     allowUnfree = true;
     permittedInsecurePackages = [ "electron-22.3.27" ];
   };
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
     };
     inherit nur pkgs vars inputs system nixneovim;
   };
 };

 laptop = lib.nixosSystem {
   inherit system;
   modules = [
     ./laptop
     ./configuration.nix
     home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs   = true;
      home-manager.useUserPackages = true;
     }
   ];
   specialArgs = {
     host = {
       hostName = "laptop";
     };
     inherit nur pkgs vars inputs system nixneovim;
   };
 };
}
