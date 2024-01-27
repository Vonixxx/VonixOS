###########
# VonixOS #
############
# Profiles #
############
{ nixpkgs, arkenfox, home-manager, ... }:

let 
 pkgs = import nixpkgs { config.allowUnfree = false; };
in { 
 f.jarka = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit pkgs arkenfox; };

   modules = [
     ./configuration.nix
     ./hosts/laptops/hp/f.jarka/imports.nix
     home-manager.nixosModules.home-manager
   ];
 };

 f.stepanka = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit pkgs arkenfox; };

   modules = [
     ./configuration.nix
     ./hosts/laptops/hp/f.stepanka/imports.nix
     home-manager.nixosModules.home-manager
   ];
 };

 f.libor = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit pkgs arkenfox; };
 
   modules = [
     ./configuration.nix
     ./hosts/miniature/minix/f.libor/imports.nix
     home-manager.nixosModules.home-manager
   ];
 };

 u.luca = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit pkgs arkenfox; };

   modules = [
     ./configuration.nix
     ./hosts/laptops/lenovo/u.luca/imports.nix
     home-manager.nixosModules.home-manager
   ];
 };
}
