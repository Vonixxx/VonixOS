###########
# VonixOS #
############
# Profiles #
############
{ nixpkgs, arkenfox, home-manager, ... }:

let 
 lib  = nixpkgs.lib;
 pkgs = import nixpkgs { config.allowUnfree = true; };
in { 
 "f.jarka" = lib.nixosSystem {
   specialArgs = { inherit pkgs arkenfox; };

   modules = [
     ../system
     ./database/laptops/hp/f.jarka
     home-manager.nixosModules.home-manager
   ];
 };

 "f.stepanka" = lib.nixosSystem {
   specialArgs = { inherit pkgs arkenfox; };

   modules = [
     ../system
     ./database/laptops/hp/f.stepanka
     home-manager.nixosModules.home-manager
   ];
 };

 "f.libor" = lib.nixosSystem {
   specialArgs = { inherit pkgs arkenfox; };
 
   modules = [
     ../system
     ./database/laptops/hp/f.libor
     home-manager.nixosModules.home-manager
   ];
 };

 "u.luca" = lib.nixosSystem {
   specialArgs = { inherit pkgs arkenfox; };

   modules = [
     ../system
     ./database/laptops/lenovo/u.luca
     home-manager.nixosModules.home-manager
   ];
 };
}