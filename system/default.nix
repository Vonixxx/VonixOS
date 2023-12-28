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
     ./hosts/vanillaos-gnome/configuration.nix
     home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs   = true;
      home-manager.useUserPackages = true;
     }
   ];

   specialArgs = { inherit pkgs vars arkenfox unknown-vars; };
 };
}
