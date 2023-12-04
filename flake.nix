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
   ###################
   # Repository URLs #
   ###################
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
    liveWallpaper   = "Aurora.mp4";                     # For Sway
    staticWallpaper = "Mystical.png";                   # For Sway
    font            = "CascadiaCode";                   # For Kitty and Waybar
    theme           = "Catppuccin-Mocha";               # For BAT and Kitty
    cursor          = "Catppuccin-Mocha-Light-Cursors"; # For Sway - Also, Change Manually in Sway Configuration -> pointerCursor.package = ... 
    sway = {
      urgent          = "#F38BA8";
      foreground      = "#CDD6F4";
      focusedBorder   = "#CBA6F7";
      unfocusedBorder = "#000000";
    };
    foot = {
      alpha      = 1.0;
      bright0    = "988BA2"; 
      bright1    = "F28FAD"; 
      bright2    = "ABE9B3"; 
      bright3    = "FAE3B0"; 
      bright4    = "96CDFB"; 
      bright5    = "F5C2E7"; 
      bright6    = "89DCEB"; 
      bright7    = "D9E0EE";  
      regular0   = "6E6C7E"; 
      regular1   = "F28FAD"; 
      regular2   = "ABE9B3"; 
      regular3   = "FAE3B0"; 
      regular4   = "96CDFB"; 
      regular5   = "F5C2E7"; 
      regular6   = "89DCEB"; 
      regular7   = "D9E0EE"; 
      foreground = "D9E0EE";
      background = "1E1D2F";
    };
    waybar = {
      foreground       = "#CDD6F4";
      background1      = "#1E1E2E";
      background2      = "#181825";
      background3      = "#11111B";
      urgentBackground = "#1E1E2E";
      urgentForeground = "#F38BA8";
      power            = "#F38BA8";
      sleep            = "#89B4FA";
      reboot           = "#F9E2AF";
      battery          = "#A6E3A1";
      network          = "#89DCEB";
      backlight        = "#F9E2AF";
      pulseaudio       = "#CBA6F7";
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
