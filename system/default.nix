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
 sway = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit pkgs vars arkenfox unknown-vars; };

   modules = [
     ./hosts/sway/machine
     ./general-configuration.nix
     ./hosts/sway/configuration.nix
     home-manager.nixosModules.home-manager { home-manager.useGlobalPkgs = true; }
   ];
 };

 gnome = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit pkgs vars arkenfox unknown-vars; };

   modules = [
     ./hosts/gnome/machine
     ./general-configuration.nix
     ./hosts/gnome/configuration.nix
     home-manager.nixosModules.home-manager { home-manager.useGlobalPkgs = true; }
   ];
 };
}
