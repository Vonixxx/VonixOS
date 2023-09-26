###########
# VonixOS #
#######################
# Flake Configuration #
#######################

{
  description = "Laptop";

  inputs = {
    nixneovim = {
      url = github:nixneovim/nixneovim;
    };
    nixpkgs = {
      url = github:NixOS/nixpkgs/nixos-unstable;
    };
  };


  outputs = { self, nixpkgs, nixneovim }: {
   nixosConfigurations.vonix = nixpkgs.lib.nixosSystem {
     system = "x86_64-linux";
     specialArgs = {
       overlays = [ nixneovim.overlays.default ];
     };
     modules = [ 
       ./configuration.nix 
       nixneovim.nixosModules.default
     ];
   };
 };
}
