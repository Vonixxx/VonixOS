###########
# VonixOS #
#####################
# Bar Configuration #
#####################
{ config, pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.waybar = {
    enable = true;
    style = ''
       /* Colors */
       @define-color base   #2E3440;
       @define-color text   #ECEFF4;
       @define-color urgent #D08770;
       
       /* Base */
       * {
	min-height:    0px;
	border-radius: 10px;
	border:        none;
        margin:        1px 2px 2px 2px;
       }
    
       /* Whole Bar */
       #waybar {
        font-size:   20px;
        font-weight: bold;
        font-family: CascadiaCode;
        background:  rgba(0,0,0,0);
       }
    
       /* Modules */
       #cpu,
       #mode,
       #disk,
       #clock,
       #battery,
       #network,
       #backlight,
       #pulseaudio,
       #custom-power,
       #custom-reboot,
       #custom-hibernate {
        color:      @text;
        background: @base;
	padding:    2px 12px;
       }

       #custom-hibernate {
	padding-right: 15px;
       }

       #network { 
	padding-right: 20px;
       }

       #custom-power,
       #custom-reboot {
	padding-right: 12.5px;
       }

       /* Workspaces */
       #workspaces button {
        opacity:       0.5;
        background:    none;
	padding-right: 20px;
        color:         @text;
       }
       #workspaces button.urgent {
        opacity:    0.8;
        background: @base;
        color:      @urgent;
       }
       #workspaces button.focused {
        opacity:    1;
        background: @base;
       }
    '';
    settings = [{
        height   = 30;
        layer    = "top";
        position = "top";

        modules-center = [ "sway/workspaces" ];
        modules-right  = [ "pulseaudio" "backlight" "disk" "clock" ];
        modules-left   = [ "custom/power" "custom/reboot" "custom/hibernate" "battery" "network" "sway/mode" ];

        "sway/workspaces" = {
          all-outputs  = true;
          format       = "{icon}";
          format-icons = {
            "1" = "<big>󰜏</big>";
            "2" = "<big>󰆍</big>";
            "3" = "<big>󰭣</big>";
            "4" = "<big>󰯜</big>";
          };
        };
	"disk" = {
	  interval = 60;
	  path     = "/";
          tooltip  = false;
	  format   = "󰋊 {percentage_used}%";
	};
        "backlight" = {
          tooltip        = false;
          format         = "󰃠  {percent}%";
          on-scroll-up   = "exec light -A 1";
          on-scroll-down = "exec light -U 1";
        };
        "clock" = {
          interval = 30;
          tooltip  = false;
          format   = "{:󰃭 %d/%m/%y | %H:%M}";
        };
        "custom/power" = {
          tooltip  = false;
          on-click = "exec poweroff";
          format   = "<big><span foreground=\"#BF616A\">󰐥</span></big>";
        };
        "custom/hibernate" = {
          tooltip  = false;
          on-click = "systemctl suspend";
          format   = "<big><span foreground=\"#5E81AC\">󰜗</span></big>";
        };
        "custom/reboot" = {
          tooltip  = false;
          on-click = "exec reboot";
          format   = "<big><span foreground=\"#EBCB8B\">󰜉</span></big>";
        };
        "pulseaudio" = {
          scroll-step = 1;
          tooltip     = false;
          format-icons = {
            headphone = "󰋋";
            default   = ["󰕿" "󰖀" "󰕾"];
          };
          format = "{icon}  {volume}%";
          on-click = "kitty zsh -c 'pulsemixer'";
        };
	"network" = {
          tooltip             = false;
          on-click            = "kitty zsh -c 'nmtui'";
          format-disconnected = "<big><span foreground=\"#BF616A\">󰤭</span></big>";
	  format-wifi         = "<big><span foreground=\"#A3bE8C\">󰤨</span></big>";
	  format-ethernet     = "<big><span foreground=\"#A3BE8C\">󰈀</span></big>";
        };
        "battery" = {
          interval                   = 5;
          bat                        = "BAT0";
          format-icons               = ["󰁻" "󰁽" "󰁿" "󰂁" "󰁹"];
          tooltip-format-charging    = "Full Charge Duration: {time}";
          tooltip-format-discharging = "Discharging Duration: {time}";
          format-charging            = "<big><span foreground=\"#EBCB8B\">󰂄</span></big>";
          format                     = "<big><span foreground=\"#A3BE8C\">{icon}</span></big>";
        };
     }];
   };
 };
}
