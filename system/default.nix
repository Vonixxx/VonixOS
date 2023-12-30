###########
# VonixOS #
###################
# Default Profile #
###################
{ nur, vars, nixpkgs, arkenfox, home-manager, unknown-vars, ... }:

let 
  pkgs = import nixpkgs {
    overlays = [ nur.overlay ];
    config   = { allowUnfree = false; };
  };
in { 
 vonixos-sway = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit pkgs vars arkenfox unknown-vars; };

   modules = [
     ./general-configuration.nix
     ./hosts/vonixos-sway/machine
     ./hosts/vonixos-sway/configuration.nix
     home-manager.nixosModules.home-manager { home-manager.useGlobalPkgs = true; }
   ];
 };

 vanillaos-gnome = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit pkgs vars arkenfox unknown-vars; };

   modules = [
     ./general-configuration.nix
     ./hosts/vanillaos-gnome/machine
     ./hosts/vanillaos-gnome/configuration.nix
     home-manager.nixosModules.home-manager { home-manager.useGlobalPkgs = true; }
   ];
 };
}
