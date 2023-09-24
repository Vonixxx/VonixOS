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
       modules = [ ../configuration.nix ]
     };
   };
 };
}
