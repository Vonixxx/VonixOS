###########
# VonixOS #
############
# Profiles #
############
{ nur, arkenfox, home-manager, nixpkgs-stable, ... }:

let 
  unstable = import nixpkgs-stable {
    overlays = [ nur.overlay ];
    config   = { allowUnfree = false; };
  };
in { 
 lenovo = nixpkgs-stable.lib.nixosSystem {
   specialArgs = { inherit arkenfox stable; };

   modules = [
     ./configuration.nix
     ./hosts/laptops/lenovo/imports.nix
     home-manager.nixosModules.home-manager { home-manager.useGlobalPkgs = true; }
   ];
 };

 hp = nixpkgs-stable.lib.nixosSystem {
   specialArgs = { inherit arkenfox stable; };

   modules = [
     ./configuration.nix
     ./hosts/laptops/hp/imports.nix
     home-manager.nixosModules.home-manager { home-manager.useGlobalPkgs = true; }
   ];
 };

 lian-li = nixpkgs-stable.lib.nixosSystem {
   specialArgs = { inherit arkenfox stable; };

   modules = [
     ./configuration.nix
     ./hosts/desktops/lian-li/imports.nix
     home-manager.nixosModules.home-manager { home-manager.useGlobalPkgs = true; }
   ];
 };
}
