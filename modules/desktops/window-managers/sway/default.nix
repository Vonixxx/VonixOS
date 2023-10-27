###########
# VonixOS #
######################
# Sway Configuration #
######################
{ lib, host, pkgs, vars, config, ... }:

with lib;
{
 imports = [
   ../modules/programs/fuzzel/default.nix
   ../modules/programs/waybar/default.nix
   ../modules/programs/wlsunset/default.nix
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
   environment.systemPackages = with pkgs; [
     autotiling      
     grim
     slurp
     swaybg
     wl-clipboard
   ];

   services = {
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
    liberation_ttf
    (nerdfonts.override { fonts = [ "${vars.font}" ]; })
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
         bars   = [{ command = "waybar"; }];
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
           #######################
           # Utilities Shortcuts #
           #######################
           "Up+l"   ="exec ${pkgs.light}/bin/light -A 5";  
           "Down+l" ="exec ${pkgs.light}/bin/light -U 5";  
           "Up+m"   = "exec ${pkgs.pulsemixer}/bin/pulsemixer --mute";
           "Down+m" = "exec ${pkgs.pulsemixer}/bin/pulsemixer --unmute";
           "Up+v"   = "exec ${pkgs.pulsemixer}/bin/pulsemixer --change-volume +5";
           "Down+v" = "exec ${pkgs.pulsemixer}/bin/pulsemixer --change-volume -5";
           #####################
           # Program Shortcuts #
           #####################
           "${modifier}+t" = "exec ${pkgs.kitty}/bin/kitty";
           "${modifier}+d" = "exec ${pkgs.fuzzel}/bin/fuzzel";
           "${modifier}+b" = "exec ${pkgs.firefox}/bin/firefox";
           "${modifier}+y" = "exec ${pkgs.freetube}/bin/freetube";
           "${modifier}+p" = "exec ${pkgs.grim}/bin/grim ~/Pictures/screenshot.png | ${pkgs.slurp}/bin/slurp";
         };
	 startup = [
           { command = "${pkgs.autotiling}/bin/autotiling"; always = true; }
           { command = "swaybg -i /home/'${vars.user}'/GitHub/VonixOS/modules/desktops/window-managers/modules/wallpapers/Stars.jpg -m fill"; always = true; }
         ];
         colors = {
           urgent          = { childBorder = "${vars.swayColors.urgent}";          border = "${vars.swayColors.urgent}";          background = "${vars.swayColors.text}"; text = "${vars.swayColors.text}"; indicator = "${vars.swayColors.urgent}"; };
           focused         = { childBorder = "${vars.swayColors.focusedborder}";   border = "${vars.swayColors.focusedborder}";   background = "${vars.swayColors.text}"; text = "${vars.swayColors.text}"; indicator = "${vars.swayColors.focusedborder}"; };
           unfocused       = { childBorder = "${vars.swayColors.unfocusedborder}"; border = "${vars.swayColors.unfocusedborder}"; background = "${vars.swayColors.text}"; text = "${vars.swayColors.text}"; indicator = "${vars.swayColors.unfocusedborder}"; };
           focusedInactive = { childBorder = "${vars.swayColors.unfocusedborder}"; border = "${vars.swayColors.unfocusedborder}"; background = "${vars.swayColors.text}"; text = "${vars.swayColors.text}"; indicator = "${vars.swayColors.unfocusedborder}"; };
         };
       };
     };
   };
 };
}
