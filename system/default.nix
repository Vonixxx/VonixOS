###########
# VonixOS #
############
# Profiles #
############
{ nixpkgs, arkenfox, home-manager, ... }:

let 
 pkgs = import nixpkgs { config.allowUnfree = false; };
in
{ 
 hp = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit pkgs arkenfox; };

   modules = [
     ./configuration.nix
     ./hosts/laptops/hp/imports.nix
     home-manager.nixosModules.home-manager
   ];
 };

minix = nixpkgs.lib.nixosSystem {
  specialArgs = { inherit pkgs arkenfox; };

  modules = [
    ./configuration.nix
    ./hosts/mini/hp/imports.nix
    home-manager.nixosModules.home-manager
  ];
};

lenovo = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit pkgs arkenfox; };

   modules = [
     ./configuration.nix
     ./hosts/laptops/lenovo/imports.nix
     home-manager.nixosModules.home-manager
   ];
 };
}
