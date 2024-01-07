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
 laptop-lenovo = nixpkgs-unstable.lib.nixosSystem {
   specialArgs = { inherit vars arkenfox unstable unknown-vars; };

   modules = [
     ./general-configuration.nix
     ./hosts/laptop-lenovo/imports.nix
     home-manager.nixosModules.home-manager { home-manager.useGlobalPkgs = true; }
   ];
 };

 laptop-hp = nixpkgs-stable.lib.nixosSystem {
   specialArgs = { inherit vars stable arkenfox unknown-vars; };

   modules = [
     ./general-configuration.nix
     ./hosts/laptop-hp/imports.nix
     home-manager.nixosModules.home-manager { home-manager.useGlobalPkgs = true; }
   ];
 };

 desktop = nixpkgs-unstable.lib.nixosSystem {
   specialArgs = { inherit vars arkenfox unstable unknown-vars; };

   modules = [
     ./general-configuration.nix
     ./hosts/desktop/imports.nix
     home-manager.nixosModules.home-manager { home-manager.useGlobalPkgs = true; }
   ];
 };
}
