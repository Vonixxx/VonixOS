###########
# VonixOS #
###################
# Default Profile #
###################
{ nur, vars, arkenfox, home-manager, unknown-vars, nixpkgs-unstable, ... }:

let 
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

 hp = nixpkgs-unstable.lib.nixosSystem {
   specialArgs = { inherit vars arkenfox unstable unknown-vars; };

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
