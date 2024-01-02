###########
# VonixOS #
###################
# Default Profile #
###################
{ nur, vars, nixpkgs, arkenfox, home-manager, unknown-vars, ... }:

let 
  pkgs = import nixpkgs {
    overlays = [ nur.overlay ];
    config   = { allowUnfree = true; };
  };
in { 
 sway = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit pkgs vars arkenfox unknown-vars; };

   modules = [
     ./general-configuration.nix
     ./hosts/sway/configuration.nix
     home-manager.nixosModules.home-manager { home-manager.useGlobalPkgs = true; }
   ];
 };

 gnome = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit pkgs vars arkenfox unknown-vars; };

   modules = [
     ./general-configuration.nix
     ./hosts/gnome/configuration.nix
     home-manager.nixosModules.home-manager { home-manager.useGlobalPkgs = true; }
   ];
 };

 hyprland = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit pkgs vars arkenfox unknown-vars; };

   modules = [
     ./general-configuration.nix
     ./hosts/hyprland/configuration.nix
     home-manager.nixosModules.home-manager { home-manager.useGlobalPkgs = true; }
   ];
 };
}
