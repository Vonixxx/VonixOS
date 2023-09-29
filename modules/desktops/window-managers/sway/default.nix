###########
# VonixOS #
######################
# Sway Configuration #
######################
{ lib, host, pkgs, vars, config, ... }:

with lib;
{
 imports = [
   ../programs/bat/default.nix
   ../programs/git/default.nix
   ../programs/lsd/default.nix
   ../programs/kitty/default.nix
   ../programs/fuzzel/default.nix
   ../programs/waybar/default.nix
   ../programs/joshuto/default.nix
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
   laptop.enable = true;

   programs = {
     sway = {
       enable = true;
       extraPackages = with pkgs; [
         autotiling      
	 bat
	 fuzzel
	 greetd.greetd
	 greetd.tuigreet
	 joshuto
	 kitty
	 lsd
	 light
	 tlp
	 wlsunset
         wl-clipboard
       ];
     };
   };

   hardware.bluetooth = {
     enable = true;
     settings = {
       General = {
         Enable = "Source,Sink,Media,Socket";
       };
     };
   };

   services = {
     blueman.enable = true;
     tlp = {
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

   home-manager.users.${vars.user} = {
     wayland.windowManager.sway = {
       enable   = true;
       xwayland = true;
       extraConfig = ''
          output "*" bg /home/vonix/VonixOS/Stars.jpg fill
       '';
       config = rec {
         up       = "k";
         down     = "j";
         left     = "l";
         right    = "h";
         modifier = "Mod4";
         input    = { "*" = { xkb_variant = "us"; }; };
         output   = { eDP-1 = { mode = "1920x1080@60Hz"; }; };
         keybindings = {
           ######################
           # Switching Position #
           ######################
           "${modifier}+Shift+k" = "move up";
           "${modifier}+Shift+h" = "move left";
           "${modifier}+Shift+j" = "move down";
           "${modifier}+Shift+l" = "move right";
           ############
           # Commands #
           ############
           "${modifier}+c"       = "kill";
           "${modifier}+r"       = "reload";
           "${modifier}+f"       = "fullscreen";
           "${modifier}+s"       = "mode resize";
           ###################
           # Switching Focus #
           ###################
           "${modifier}+k"       = "focus up";
           "${modifier}+h"       = "focus left";
           "${modifier}+j"       = "focus down";
           "${modifier}+l"       = "focus right";
           ########################
           # Switching Workspaces #
           ########################
           "${modifier}+1"       = "workspace number 1";
           "${modifier}+2"       = "workspace number 2";
           "${modifier}+3"       = "workspace number 3";
           "${modifier}+4"       = "workspace number 4";
           #####################
           # Program Shortcuts #
           #####################
           "${modifier}+l" = "exec ${pkgs.kitty}/bin/kitty";
           "${modifier}+d" = "exec ${pkgs.fuzzel}/bin/fuzzel";
           "${modifier}+b" = "exec ${pkgs.librewolf}/bin/librewolf";
           ######################################
           # Switching Containers -> Workspaces #
           ######################################
           "${modifier}+Shift+1" = "move container to workspace number 1";
           "${modifier}+Shift+2" = "move container to workspace number 2";
           "${modifier}+Shift+3" = "move container to workspace number 3";
           "${modifier}+Shift+4" = "move container to workspace number 4";
         };

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

	 startup = [
           {command = "${pkgs.autotiling}/bin/autotiling"; always = true;}
         ];

         colors = {
           background      = "${vars.swaycolors.base}";
           focused         = { childBorder = "${vars.swaycolors.white}"; border = "${vars.swaycolors.white}"; background = "${vars.swaycolors.base}"; text = "${vars.swaycolors.white}"; indicator = "${vars.swaycolors.white}"; };
           unfocused       = { childBorder = "${vars.swaycolors.black}"; border = "${vars.swaycolors.black}"; background = "${vars.swaycolors.base}"; text = "${vars.swaycolors.white}"; indicator = "${vars.swaycolors.black}"; };
           focusedInactive = { childBorder = "${vars.swaycolors.black}"; border = "${vars.swaycolors.black}"; background = "${vars.swaycolors.base}"; text = "${vars.swaycolors.white}"; indicator = "${vars.swaycolors.black}"; };
           urgent          = { childBorder = "${vars.swaycolors.white}"; border = "${vars.swaycolors.white}"; background = "${vars.swaycolors.base}"; text = "${vars.swaycolors.white}"; indicator = "${vars.swaycolors.overlay}"; };
           placeholder     = { childBorder = "${vars.swaycolors.overlay}"; border = "${vars.swaycolors.overlay}"; background = "${vars.swaycolors.base}"; text = "${vars.swaycolors.white}"; indicator = "${vars.swaycolors.overlay}"; };
         };
       };
     };
   };
 };
}
