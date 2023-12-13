###########
# VonixOS #
######################
# Sway Configuration #
######################
{ lib, pkgs, vars, config, ... }:

with lib;
{
 options = {
   sway.enable = mkOption {
     default = false;
     type    = types.bool;
   };
 };

 imports = [
   ./programs/fuzzel/default.nix
   ./programs/waybar/default.nix
   ./programs/wlsunset/default.nix
 ];

 config = mkIf (config.sway.enable) {
   environment = {
    systemPackages = with pkgs; [
      ##############
      # Ergonomics #
      ##############
      autotiling      
      alsa-utils
      #######################
      # Screen/Text Capture #
      #######################
      grim
      mpvpaper
      slurp
      swaybg
      swayimg
      ###################
      # File Management #
      ###################
      catdoc
      gnutar
      mupdf
      odt2txt
      pigz
      p7zip
      pbzip2
      pandoc
      poppler_utils
      unzip
    ];

    loginShellInit = ''
       if [ "$(tty)" = "/dev/tty1" ]; then
         exec sway
       fi
    '';
  };

  home-manager.users.${vars.user} = {
     home.pointerCursor = {
       size       = 64;
       gtk.enable = true;
       name       = "Catppuccin-Mocha-Light-Cursors";
       package    = pkgs.catppuccin-cursors.mochaLight;
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
           top        = 10;
           left       = 10;
           outer      = 10;
           inner      = 10;
           right      = 10;
           bottom     = 10;
           vertical   = 10;
           horizontal = 10;
         };

         window = { titlebar = false; };
         bars   = [ { command = "waybar"; } ];
         input  = { "*" = { xkb_variant = "us"; }; };
         output = { ${vars.output} = { mode = "${vars.outputConfig}"; }; };

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
           ######################################
           # Switching Containers -> Workspaces #
           ######################################
           "${modifier}+Shift+1" = "move container to workspace number 1";
           "${modifier}+Shift+2" = "move container to workspace number 2";
           "${modifier}+Shift+3" = "move container to workspace number 3";
           "${modifier}+Shift+4" = "move container to workspace number 4";
           #####################
           # Program Shortcuts #
           #####################
           "${modifier}+t" = "exec ${pkgs.foot}/bin/foot";
           "${modifier}+d" = "exec ${pkgs.fuzzel}/bin/fuzzel";
           "${modifier}+b" = "exec ${pkgs.firefox}/bin/firefox";
           "${modifier}+y" = "exec ${pkgs.freetube}/bin/freetube";
           "${modifier}+p" = "exec ${pkgs.grim}/bin/grim -g '$(slurp)'";
         };

	       startup = [ 
           { command = "${pkgs.autotiling}/bin/autotiling"; always = true; } 
           { command = "swaybg -i /home/'${vars.user}'/GitHub/VonixOS/modules/wallpapers/'${vars.staticWallpaper}' -m fill"; always = true; }
           # { command = "mpvpaper -o 'no-audio --loop-playlist' '*' /home/'${vars.user}'/GitHub/VonixOS/modules/wallpapers/'${vars.liveWallpaper}'"; always = true; }
         ];

         colors = {
           urgent          = { childBorder = "${vars.sway.urgent}";          border = "${vars.sway.urgent}";          background = "${vars.sway.foreground}"; text = "${vars.sway.foreground}"; indicator = "${vars.sway.urgent}"; };
           focused         = { childBorder = "${vars.sway.focusedBorder}";   border = "${vars.sway.focusedBorder}";   background = "${vars.sway.foreground}"; text = "${vars.sway.foreground}"; indicator = "${vars.sway.focusedBorder}"; };
           unfocused       = { childBorder = "${vars.sway.unfocusedBorder}"; border = "${vars.sway.unfocusedBorder}"; background = "${vars.sway.foreground}"; text = "${vars.sway.foreground}"; indicator = "${vars.sway.unfocusedBorder}"; };
           focusedInactive = { childBorder = "${vars.sway.unfocusedBorder}"; border = "${vars.sway.unfocusedBorder}"; background = "${vars.sway.foreground}"; text = "${vars.sway.foreground}"; indicator = "${vars.sway.unfocusedBorder}"; };
         };
       };
     };
   };
 };
}
