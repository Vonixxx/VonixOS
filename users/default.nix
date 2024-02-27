###########
# VonixOS #
############
# Profiles #
############
{ disko
, xremap
, nixpkgs
, arkenfox
, home-manager
, ...
}:

let 
 lib  = nixpkgs.lib;
 pkgs = import nixpkgs { config.allowUnfree = true; };
in { 
 "v.laptop" = lib.nixosSystem {
   specialArgs = { inherit pkgs xremap arkenfox; };

   modules = [
     ../system
     ./vonix/common
     ./vonix/laptop
     disko.nixosModules.disko
     home-manager.nixosModules.home-manager
   ];
 };

 "v.desktop" = lib.nixosSystem {
   specialArgs = { inherit pkgs xremap arkenfox; };

   modules = [
     ../system
     ./vonix/common
     ./vonix/desktop
     disko.nixosModules.disko
     home-manager.nixosModules.home-manager
   ];
 };

 "f.jarka" = lib.nixosSystem {
   specialArgs = { inherit pkgs arkenfox; };

   modules = [
     ../system
     ./database/laptops/hp/f.jarka
     disko.nixosModules.disko
     home-manager.nixosModules.home-manager
   ];
 };

 "u.ofelia" = lib.nixosSystem {
   specialArgs = { inherit pkgs arkenfox; };

   modules = [
     ../system
     ./database/laptops/hp/u.ofelia
     disko.nixosModules.disko
     home-manager.nixosModules.home-manager
   ];
 };

 "f.libor" = lib.nixosSystem {
   specialArgs = { inherit pkgs arkenfox; };
 
   modules = [
     ../system
     ./database/miniature/minix/f.libor
     disko.nixosModules.disko
     home-manager.nixosModules.home-manager
   ];
 };

 "f.stepanka" = lib.nixosSystem {
   specialArgs = { inherit pkgs arkenfox; };

   modules = [
     ../system
     ./database/laptops/hp/f.stepanka
     disko.nixosModules.disko
     home-manager.nixosModules.home-manager
   ];
 };
}
