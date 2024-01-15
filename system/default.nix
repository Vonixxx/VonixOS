###########
# VonixOS #
############
# Profiles #
############
{ stable, arkenfox, home-manager, ... }:

let
 stable = import nixpkgs;
in 
{ 
 lenovo = stable.lib.nixosSystem {
   specialArgs = { inherit stable arkenfox; };

   modules = [
     ./configuration.nix
     ./hosts/laptops/lenovo/imports.nix
     home-manager.nixosModules.home-manager
   ];
 };

 hp = stable.lib.nixosSystem {
   specialArgs = { inherit stable arkenfox; };

   modules = [
     ./configuration.nix
     ./hosts/laptops/hp/imports.nix
     home-manager.nixosModules.home-manager
   ];
 };

 lian-li = stable.lib.nixosSystem {
   specialArgs = { inherit stable arkenfox; };

   modules = [
     ./configuration.nix
     ./hosts/desktops/lian-li/imports.nix
     home-manager.nixosModules.home-manager
   ];
 };
}
