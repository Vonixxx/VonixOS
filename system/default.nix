###########
# VonixOS #
############
# Profiles #
############
{ nur, arkenfox, home-manager, nixpkgs-stable, ... }:

let 
  stable = import nixpkgs-stable {
    overlays = [ nur.overlay ];
    config   = { allowUnfree = false; };
  };
in { 
 lenovo = nixpkgs-stable.lib.nixosSystem {
   specialArgs = { inherit stable arkenfox; };

   modules = [
     ./configuration.nix
     ./hosts/laptops/lenovo/imports.nix
     home-manager.nixosModules.home-manager
   ];
 };

 hp = nixpkgs-stable.lib.nixosSystem {
   specialArgs = { inherit stable arkenfox; };

   modules = [
     ./configuration.nix
     ./hosts/laptops/hp/imports.nix
     home-manager.nixosModules.home-manager
   ];
 };

 lian-li = nixpkgs-stable.lib.nixosSystem {
   specialArgs = { inherit stable arkenfox; };

   modules = [
     ./configuration.nix
     ./hosts/desktops/lian-li/imports.nix
     home-manager.nixosModules.home-manager
   ];
 };
}
