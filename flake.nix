###########
# VonixOS #
#######################
# Flake Configuration #
#######################
# flake.nix
# └─./system
#     └─default.nix
#       ├─./machine
#       └─configuration.nix
#         └─./modules
#             ├─./desktops
#             │   └─default.nix
#             ├─./programs
#             │   └─default.nix
#             └─./terminal
#                 └─default.nix
{
 description = "Flake Configuration - Sway";

 inputs = {
   ##########################
   # Synchronizing Packages #
   ##########################
   home-manager.inputs.nixpkgs.follows = "nixpkgs";
   #####################
   # Repositories URLs #
   #####################
   nur.url          = "github:nix-community/NUR";
   home-manager.url = "github:nix-community/home-manager"; 
   nixpkgs.url      = "github:nixos/nixpkgs/nixos-unstable";
 };

 outputs = inputs @ { nur, self, nixpkgs, home-manager, ... }:
 let
  vars = {
    ########################
    # Screen Settings Sway #
    ########################
    output       = "eDP-1";
    outputConfig = "1920x1080@60Hz";
    ########################
    # GitHub Login Details #
    ########################
    githubUser = "Vonixxx";
    githubMail = "vonixxxwork@tuta.io";
    #####################
    # System Appearance #
    #####################
    wallpaper = "Rain.jpg";                       # For Sway
    font      = "CascadiaCode";                   # For Kitty and Waybar
    theme     = "Catppuccin-Mocha";               # For BAT and Kitty
    cursor    = "Catppuccin-Mocha-Light-Cursors"; # For Sway - Also, Change Manually in Sway Configuration -> pointerCursor.package = ... 
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
      inherit nur vars inputs nixpkgs home-manager;
     }
   );
 };
}
