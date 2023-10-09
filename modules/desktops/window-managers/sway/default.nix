###########
# VonixOS #
######################
# Sway Configuration #
######################
{ lib, host, pkgs, vars, config, ... }:

with lib;
{
 imports = [
   ../programs/fuzzel/default.nix
   ../programs/waybar/default.nix
   ../programs/wlsunset/default.nix
 ];

 options = {
   sway = {
     enable = mkOption {
       default = false;
       type    = types.bool;
     };
   };
 };

 config = mkIf (config.sway.enable) {
   programs = {
     light.enable = true;
     sway = {
       enable = true;
       extraPackages = with pkgs; [
         autotiling      
	       fuzzel
         grim
	       greetd.greetd
	       greetd.tuigreet
	       light
         slurp
         swaybg
	       wlsunset
         wl-clipboard
       ];
     };
   };

   services = {
     tlp.settings = {
       enable              = true;
       auto-cpufreq.enable = true;
     };
     greetd = {
       enable = true;
       settings = {
         default_session.command = ''
            ${pkgs.greetd.tuigreet}/bin/tuigreet \
            --time \
            --cmd sway \
            --asterisks \
            --user-menu \
         '';
       };
     };
   };

  fonts.packages = with pkgs; [
    line-awesome
    liberation_ttf
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
  ];

  home-manager.users.${vars.user} = {
     home = {
       pointerCursor = {
         size       = 16;
         gtk.enable = true;
         name       = "Catppuccin-Mocha-Dark-Cursors";
         package    = pkgs.catppuccin-cursors.mochaDark;
       };
     };
     wayland.windowManager.sway = {
       enable   = true;
       xwayland = true;
       config = rec {
         up       = "k";
         down     = "j";
         left     = "l";
         right    = "h";
         modifier = "Mod4";
         gaps = {
           top        = 15;
           left       = 15;
           outer      = 15;
           inner      = 15;
           right      = 15;
           bottom     = 15;
           vertical   = 15;
           horizontal = 15;
         };
         window = { titlebar = false; };
         bars   = [{ command = "waybar"; }];
         input  = { "*" = { xkb_variant = "us"; }; };
         output = { eDP-1 = { mode = "1920x1080@60Hz"; }; };
	       startup = [
           { command = "${pkgs.autotiling}/bin/autotiling"; always = true; }
           { command = "swaybg -i /home/'${vars.user}'/GitHub/VonixOS/modules/desktops/window-managers/wallpapers/Stars.jpg -m fill"; always = true; }
         ];
         keybindings = {
           ############
           # Commands #
           ############
           "${modifier}+c" = "kill";
           "${modifier}+r" = "reload";
           "${modifier}+f" = "fullscreen";
           "${modifier}+s" = "mode resize";
           ###################
           # Switching Focus #
           ###################
           "${modifier}+k" = "focus up";
           "${modifier}+h" = "focus left";
           "${modifier}+j" = "focus down";
           "${modifier}+l" = "focus right";
           ######################
           # Switching Position #
           ######################
           "${modifier}+Shift+k" = "move up";
           "${modifier}+Shift+h" = "move left";
           "${modifier}+Shift+j" = "move down";
           "${modifier}+Shift+l" = "move right";
           ########################
           # Switching Workspaces #
           ########################
           "${modifier}+1" = "workspace number 1";
           "${modifier}+2" = "workspace number 2";
           "${modifier}+3" = "workspace number 3";
           "${modifier}+4" = "workspace number 4";
           #####################
           # Program Shortcuts #
           #####################
           "${modifier}+t" = "exec ${pkgs.kitty}/bin/kitty";
           "${modifier}+d" = "exec ${pkgs.fuzzel}/bin/fuzzel";
           "${modifier}+b" = "exec ${pkgs.librewolf}/bin/librewolf";
           ######################################
           # Switching Containers -> Workspaces #
           ######################################
           "${modifier}+Shift+1" = "move container to workspace number 1";
           "${modifier}+Shift+2" = "move container to workspace number 2";
           "${modifier}+Shift+3" = "move container to workspace number 3";
           "${modifier}+Shift+4" = "move container to workspace number 4";
           #######################
           # Utilities Shortcuts #
           #######################
           "F5"    = "exec ${pkgs.light}/bin/light -U 5";
           "F6"    = "exec ${pkgs.light}/bin/light -A 5";
           "F1"    = "exec ${pkgs.pulsemixer}/bin/pulsemixer --mute";
           "F2"    = "exec ${pkgs.pulsemixer}/bin/pulsemixer --change-volume -5";
           "F3"    = "exec ${pkgs.pulsemixer}/bin/pulsemixer --change-volume +5";
           "Print" = "exec ${pkgs.grim}/bin/grim ~/Pictures/screenshot.png | ${pkgs.slurp}/bin/slurp";
         };

         colors = {
           urgent          = { childBorder = "${vars.swaycolors.urgent}"; border = "${vars.swaycolors.urgent}"; background = "${vars.swaycolors.text}"; text = "${vars.swaycolors.text}"; indicator = "${vars.swaycolors.urgent}"; };
           focused         = { childBorder = "${vars.swaycolors.focusedborder}"; border = "${vars.swaycolors.focusedborder}"; background = "${vars.swaycolors.text}"; text = "${vars.swaycolors.text}"; indicator = "${vars.swaycolors.focusedborder}"; };
           unfocused       = { childBorder = "${vars.swaycolors.unfocusedborder}"; border = "${vars.swaycolors.unfocusedborder}"; background = "${vars.swaycolors.text}"; text = "${vars.swaycolors.text}"; indicator = "${vars.swaycolors.unfocusedborder}"; };
           focusedInactive = { childBorder = "${vars.swaycolors.unfocusedborder}"; border = "${vars.swaycolors.unfocusedborder}"; background = "${vars.swaycolors.text}"; text = "${vars.swaycolors.text}"; indicator = "${vars.swaycolors.unfocusedborder}"; };
         };
       };
     };
   };
 };
}
