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
          imports = [ 
	    nixneovim.nixosModules.default 
	  ];
          programs.nixneovim = {
            enable = true;
	    plugins = {
	      treesitter = {
	        enable = true;
		installAllGrammars = true;
	      };
	      lualine = { 
	        enable = true;
		theme  = "16color";
	      };
	    };
	    colorschemes.base16 = {
	      enable      = true;
	      useTruecolor = true;
	      colorscheme = "irblack";
	    };
          };
        };
       }
     ];
   };
 };
}
