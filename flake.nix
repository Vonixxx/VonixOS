###########
# VonixOS #
#######################
# Flake Configuration #
#######################
# flake.nix
# └─./system
#     └─default.nix
#       ├─<host>
#       └─configuration.nix
#         └─./modules
#             ├─./desktops
#             │   └─default.nix
#             └─./terminal
#                 └─default.nix
{
 description = "Flake Configuration for User-Specific Host: Laptop/Desktop";

 inputs = {
   nur.url       = "github:nix-community/NUR";
   nixneovim.url = "github:nixneovim/nixneovim";
   nixpkgs.url   = "github:nixos/nixpkgs/nixos-unstable";
   home-manager = {
     inputs.nixpkgs.follows = "nixpkgs";
     url                    = "github:nix-community/home-manager";
   };
 };

 outputs = inputs @ { nur, self, nixpkgs, nixneovim, home-manager, ... }:
 let
  vars = {
    editor        = "nvim";
    userInterface = "sway";
    user          = "vonix";
    terminal      = "kitty";
    githubUser    = "Vonixxx";
    output        = "HDMI-A-1";
    defaultLocale = "en_GB.UTF-8";
    extraLocale   = "cs_CZ.UTF-8";
    outputConfig  = "2560x1440@75Hz";
    swayColors = {
      text             = "#FFFFFF";
      urgent           = "#BF616A";
      focusedborder    = "#B48EAD";
      unfocusedborder  = "#000000";
    };
    githubMail = "vonixxxwork@tuta.io";
    password    = "$6$vheawoZJxxe9N7Ml$sGnV.OE9HFDY0MQzDLUuSX38f8GPPus.cD45ptYi.Whyx1aJ5xEuHUYoz0LT/CcDP5dFbw7AdOeG7hahoeA170";
  };
 in {
   nixosConfigurations = (
     import ./system {
      inherit (nixpkgs) lib;
      inherit nur vars inputs nixpkgs nixneovim home-manager;
     }
   );
 };
}
