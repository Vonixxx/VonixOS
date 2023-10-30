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
#             ├─./programs
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
    #####################
    # System Appearance #
    #####################
    theme = "Nord";
    font  = "CascadiaCode";
    swayColors = {
      text            = "#FFFFFF";
      urgent          = "#BF616A";
      focusedborder   = "#B48EAD";
      unfocusedborder = "#000000";
    };
    ###################
    # Screen Settings #
    ###################
    output       = "eDP-1";
    outputConfig = "1920x1080@60Hz";
    ########################
    # GitHub Login Details #
    ########################
    githubUser = "Vonixxx";
    githubMail = "vonixxxwork@tuta.io";
    #############################
    # System User Login Details #
    #############################
    user     = "vonix";
    password = "$6$vheawoZJxxe9N7Ml$sGnV.OE9HFDY0MQzDLUuSX38f8GPPus.cD45ptYi.Whyx1aJ5xEuHUYoz0LT/CcDP5dFbw7AdOeG7hahoeA170";
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
