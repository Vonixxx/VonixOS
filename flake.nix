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
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  outputs = { self, nixpkgs, nixneovim, home-manager }: {
   nixosConfigurations.vonix = nixpkgs.lib.nixosSystem {
     system = "x86_64-linux";
     specialArgs = {
       overlays = [ nixneovim.overlays.default ];
     };
     modules = [ 
       ./system/configuration.nix 
       home-manager.nixosModules.home-manager 
       {
        home-manager.users.vonix = {
          home.stateVersion = "23.11";
          imports = [ nixneovim.nixosModules.default ];
          programs.nixneovim = {
            enable = true;
          };
        };
       }
     ];
   };
 };
}
