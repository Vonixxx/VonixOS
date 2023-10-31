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
    font          = "CascadiaCode";
    theme         = "Catppuccin-Mocha";              # For BAT, Kitty and Neovim
    cursor        = "Catppuccin-Mocha-Light-Cursors";
    cursorPackage = "pkgs.catppuccin-cursors.mochaLight";
    sway = {
      urgent          = "#F38BA8";
      foreground      = "#CDD6F4";
      focusedBorder   = "#CBA6F7";
      unfocusedBorder = "#000000";
    };
    waybar = {
      foreground       = "#CDD6F4";
      background       = "#11111B";
      urgentBackground = "#1E1E2E";
      urgentForeground = "#F38BA8";
      power            = "#F38BA8";
      sleep            = "#89B4FA";
      reboot           = "#F9E2AF";
      battery          = "#A6E3A1";
      network          = "#A6E3A1";
    };
    oh-my-posh = {
      backgroundGit     = "#A6E3A1";
      backgroundIcon    = "#11111B";
      backgroundPath    = "#CBA6F7";
      backgroundCode    = "#F38BA8";
      foregroundIcon    = "#CDD6F4";
      foregroundDefault = "#11111B";
    };
    fuzzel = {
      match               = "#F38bA8DD";
      border              = "#CBA6F7DD";
      foreground          = "#CDD6F4DD";
      background          = "#313244DD";
      selection           = "#11111BDD";
      selectionMatch      = "#F38BA8DD";
      selectionForeground = "#CDD6F4DD";
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
