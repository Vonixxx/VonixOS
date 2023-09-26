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
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = github:nix-community/home-manager;
    };
    nixpkgs = {
      url = github:NixOS/nixpkgs/nixos-unstable;
    };
  };


  outputs = { self, nixpkgs, home-manager, nixneovim }: {
   nixosConfigurations.vonix = nixpkgs.lib.nixosSystem {
     system = "x86_64-linux";
     modules = [ 
       ./configuration.nix 
       { nixpkgs.overlays = [ nixneovim.overlays.default ]; }
       home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs   = true;
        home-manager.useUserPackages = true;
        home-manager.users.vonix = { imports = [ ./home-manager/default.nix ]; };
       }
     ];
   };
 };
}
