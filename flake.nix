{
 description = "Flake Prototype";




 inputs = {
   nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
 };




 outputs = { self, nixpkgs }: 
 let
   lib    = nixpkgs.lib;
   system = "x86_64-linux";
   pkgs   = import nixpkgs {
     inherit system;
     config.allowUnfree = true;
   };
 in {
   nixosConfigurations = {
     vonix = lib.nixosSystem {
       inherit system;
       modules = [ 
         ############
         # Programs #
         ############
         ./bat/default.nix
         ./git/default.nix
         ./lsd/default.nix
         ./zsh/default.nix
         ./tlp/default.nix
         ./sway/default.nix
         ./mako/default.nix
         ./kitty/default.nix
         ./neovim/default.nix
         ./waybar/default.nix
         ./joshuto/default.nix
         ./wlsunset/default.nix
         ./home-manager/default.nix
         ./login-manager/default.nix
         ###############
         # Base System #
         ###############
         ./configuration.nix
         ./system/packages.nix
         ./hardware-configuration.nix
       ];
     };
   };
 };
}
