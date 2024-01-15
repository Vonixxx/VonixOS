###########
# VonixOS #
############
# Profiles #
############
{ nixpkgs, arkenfox, home-manager, ... }:

let
 stable = import nixpkgs;
in 
{ 
 lenovo = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit stable arkenfox; };

   modules = [
     ./configuration.nix
     ./hosts/laptops/lenovo/imports.nix
     home-manager.nixosModules.home-manager
   ];
 };

 hp = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit stable arkenfox; };

   modules = [
     ./configuration.nix
     ./hosts/laptops/hp/imports.nix
     home-manager.nixosModules.home-manager
   ];
 };

 lian-li = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit stable arkenfox; };

   modules = [
     ./configuration.nix
     ./hosts/desktops/lian-li/imports.nix
     home-manager.nixosModules.home-manager
   ];
 };
}
