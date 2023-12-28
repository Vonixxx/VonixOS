###########
# VonixOS #
###################
# Default Profile #
###################
{ nur, vars, nixpkgs, arkenfox, home-manager, unknown-vars, ... }:

let
 lib = nixpkgs.lib;

 pkgs = import nixpkgs {
   overlays = [ nur.overlay ];
   config   = { allowUnfree = false; }; 
 };
in { 
 vonixos-sway = lib.nixosSystem {
   modules = [
     ./hosts/vonixos-sway/machine
     ./hosts/vonixos-sway/version.nix
     ./hosts/vonixos-sway/packages.nix
     ./hosts/vonixos-sway/configuration.nix
     home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs   = true;
      home-manager.useUserPackages = true;
     }
   ];

   specialArgs = { inherit pkgs vars arkenfox unknown-vars; };
 };

 vanillaos-gnome = lib.nixosSystem {
   modules = [
     ./hosts/vanillaos-gnome/machine
     ./hosts/vanillaos-gnome/version.nix
     ./hosts/vanillaos-gnome/packages.nix
     ./hosts/vanillaos-gnome/configuration.nix
     home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs   = true;
      home-manager.useUserPackages = true;
     }
   ];

   specialArgs = { inherit pkgs vars arkenfox unknown-vars; };
 };
}
