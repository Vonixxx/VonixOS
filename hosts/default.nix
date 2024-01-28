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
     ../system/configuration/default.nix
     ./laptops/hp/f.jarka/imports.nix
     ../system/architecture/intel/cpu/default.nix
     ../system/architecture/intel/gpu/default.nix
     home-manager.nixosModules.home-manager
   ];
 };

 "f.stepanka" = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit pkgs arkenfox; };

   modules = [
     ../system/configuration/default.nix
     ./laptops/hp/f.stepanka/imports.nix
     ../system/architecture/intel/cpu/default.nix
     ../system/architecture/intel/gpu/default.nix
     home-manager.nixosModules.home-manager
   ];
 };

 "f.libor" = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit pkgs arkenfox; };
 
   modules = [
     ../system/configuration/default.nix
     ./miniature/minix/f.libor/imports.nix
     ../system/architecture/intel/cpu/default.nix
     ../system/architecture/intel/gpu/default.nix
     home-manager.nixosModules.home-manager
   ];
 };

 "u.luca" = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit pkgs arkenfox; };

   modules = [
     ../system/configuration/default.nix
     ./laptops/lenovo/f.libor/imports.nix
     ../system/architecture/amd/cpu/default.nix
     ../system/architecture/amd/gpu/default.nix
     home-manager.nixosModules.home-manager
   ];
 };
}
