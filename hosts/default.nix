###########
# VonixOS #
############
# Profiles #
############
{ nixpkgs, arkenfox, home-manager, ... }:

let 
 pkgs = import nixpkgs { config.allowUnfree = false; };
in { 
 "f.jarka" = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit pkgs arkenfox; };

   modules = [
     ../system
     ../modules
     ./laptops/hp/f.jarka
     home-manager.nixosModules.home-manager
   ];
 };

 "f.stepanka" = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit pkgs arkenfox; };

   modules = [
     ../system
     ../modules
     ./laptops/hp/f.stepanka
     home-manager.nixosModules.home-manager
   ];
 };

 "f.libor" = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit pkgs arkenfox; };
 
   modules = [
     ../system
     ../modules
     ./miniature/minix/f.libor
     home-manager.nixosModules.home-manager
   ];
 };

 "u.luca" = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit pkgs arkenfox; };

   modules = [
     ../system
     ../modules
     ./laptops/lenovo/u.luca
   ];
 };
}
