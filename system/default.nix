###########
# VonixOS #
###################
# Default Profile #
###################
{ nur, vars, arkenfox, home-manager, unknown-vars, nixpkgs-stable, nixpkgs-unstable, ... }:

let 
  stable = import nixpkgs-stable {
    overlays = [ nur.overlay ];
    config   = { allowUnfree = false; };
  };

  unstable = import nixpkgs-unstable {
    overlays = [ nur.overlay ];
    config   = { allowUnfree = false; };
  };
in { 
 lenovo = nixpkgs-unstable.lib.nixosSystem {
   specialArgs = { inherit vars arkenfox unstable unknown-vars; };

   modules = [
     ./configuration.nix
     ./hosts/laptops/lenovo/imports.nix
     home-manager.nixosModules.home-manager { home-manager.useGlobalPkgs = true; }
   ];
 };

 hp = nixpkgs-stable.lib.nixosSystem {
   specialArgs = { inherit vars stable arkenfox unstable unknown-vars; };

   modules = [
     ./configuration.nix
     ./hosts/laptops/hp/imports.nix
     home-manager.nixosModules.home-manager { home-manager.useGlobalPkgs = true; }
   ];
 };

 lian-li = nixpkgs-unstable.lib.nixosSystem {
   specialArgs = { inherit vars arkenfox unstable unknown-vars; };

   modules = [
     ./configuration.nix
     ./hosts/desktops/lian-li/imports.nix
     home-manager.nixosModules.home-manager { home-manager.useGlobalPkgs = true; }
   ];
 };
}
