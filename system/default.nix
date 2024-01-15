###########
# VonixOS #
############
# Profiles #
############
{ nixpkgs, arkenfox, home-manager, ... }:

let 
 nixpkgs = import nixpkgs = { config.allowUnfree = false; };
in
{ 
 lenovo = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit nixpkgs arkenfox; };

   modules = [
     ./configuration.nix
     ./hosts/laptops/lenovo/imports.nix
     home-manager.nixosModules.home-manager
   ];
 };

 hp = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit nixpkgs arkenfox; };

   modules = [
     ./configuration.nix
     ./hosts/laptops/hp/imports.nix
     home-manager.nixosModules.home-manager
   ];
 };

 lian-li = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit nixpkgs arkenfox; };

   modules = [
     ./configuration.nix
     ./hosts/desktops/lian-li/imports.nix
     home-manager.nixosModules.home-manager
   ];
 };
}
