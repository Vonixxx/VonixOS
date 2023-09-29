###########
# VonixOS #
######################
# Sway Configuration #
######################
{ config, pkgs, host, vars, lib, ... }:

with lib;
{
 ##############
 # Conditions #
 ##############
 conditions = {
   sway = {
     enable = mkOption {
       default = false;
       type    = types.bool;
     };
   };
 };


 #####################
 # Condition: Laptop #
 #####################
 config = mkIf (config.sway.enable) {
   laptop.enable = true;


   ############
   # Packages #
   ############
   programs = {
     sway = {
       enable = true;
       extraPackages = with pkgs; [
         autotiling      
	 bat
	 bemenu
	 greetd.greetd
	 greetd.tuigreet
	 joshuto
	 kitty
	 lsd
	 light
	 wlsunset
         wl-clipboard
         xwayland
       ];
     };
   };


   ############
   # Services #
   ############
   services.greetd = {
     ##########
     # Enable #
     ##########
     enable = true;
     ############
     # Settings #
     ############
     settings = {
       default_session.command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet \
          --time \
          --asterisks \
          --user-menu \
          --cmd sway \
       '';
     };
     ###############
     # Environment #
     ###############
     environment.etc."greetd/environments".text = ''
        sway
     '';
   };


   #######################
   # Sway Window Manager #
   #######################
   home-manager.users.${vars.user} = {
     wayland.windowManager.sway = {
       ##########
       # Enable #
       ##########
       enable   = true;
       xwayland = true;
       ############
       # Settings # 
       ############
       config = rec {
         #######################
         # Movement and Keymap #
         #######################
         up       = "k";
         down     = "j";
         left     = "l";
         right    = "h";
         modifier = "Mod4";
         input    = { "*" = { xkb_variant = "us"; }; };
         ##########
         # Output #
         ##########
         output = { eDP-1 = { mode = "1920x1080@60Hz"; }; };
         #######################
         # Extra Configuration #
         #######################
         extraConfig = ''
            output "*" bg /home/vonix/VonixOS/Stars.jpg fill
         '';
         ###############
         # Keybindings #
         ###############
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
           #########
           # Focus #
           #########
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
           "${modifier}+d"       = "exec ${vars.bemenu}";
           "${modifier}+Return"  = "exec ${pkgs.kitty}/bin/kitty";
           "${modifier}+b"       = "exec ${pkgs.librewolf}/bin/librewolf";
         };
	 ###########
	 # Startup #
	 ###########
	 startup = [
           {command = "${pkgs.autotiling}/bin/autotiling"; always = true;}
         ];
         ###########
         # Styling #
         ###########
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
         colors = {
           background      = "${vars.swaycolors.base}";
           focused         = { childBorder = "${vars.swaycolors.white}"; border = "${vars.swaycolors.white}"; background = "${vars.swaycolors.base}"; text = "${vars.swaycolors.white}"; indicator = "${vars.swaycolors.white}"; };
           unfocused       = { childBorder = "${vars.swaycolors.black}"; border = "${vars.swaycolors.black}"; background = "${vars.swaycolors.base}"; text = "${vars.swaycolors.white}"; indicator = "${vars.swaycolors.black}"; };
           focusedInactive = { childBorder = "${vars.swaycolors.black}"; border = "${vars.swaycolors.black}"; background = "${vars.swaycolors.base}"; text = "${vars.swaycolors.white}"; indicator = "${vars.swaycolors.black}"; };
           urgent          = { childBorder = "${vars.swaycolors.white}"; border = "${vars.swaycolors.white}"; background = "${vars.swaycolors.base}"; text = "${vars.swaycolors.white}"; indicator = "${vars.swaycolors.overlay}"; };
           placeholder     = { childBorder = "${vars.swaycolors.overlay}"; border = "${vars.swaycolors.overlay}"; background = "${vars.swaycolors.base}"; text = "${vars.swaycolors.white}"; indicator = swaycolors.overlay}"; };
         };
       };
     };
   };
 };
}
