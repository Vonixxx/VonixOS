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
       @define-color base #2E3440;
       @define-color text #ECEFF4;
       
       /* Base */
       * {
        border:        none;
        padding-left:  10px;
        padding-right: 10px;
        margin:        3px 0px 0px 0px;
       }
    
       /* Whole Bar */
       #waybar {
        font-size:   20px;
        font-weight: bold;
        background:  rgba(0,0,0,0);
        font-family: Cascadia-Code;
       }
    
       /* Modules */
       #cpu,
       #mode,
       #disk,
       #clock,
       #memory,
       #network,
       #battery,
       #backlight,
       #pulseaudio, 
       #custom-power,
       #custom-reboot,
       #custom-hibernate {
        color:         @text;
        background:    @base;
        padding:       10px 12px;
       }

       #disk,
       #clock, 
       #backlight,
       #pulseaudio {
        margin-left:   5px;
        border-radius: 10px;
       }

       #network,
       #battery {
        margin-left:   5px;
        border-radius: 10px;
        padding-right: 20px;
       }
 
       #custom-power {
        border-top-left-radius:    10px;
        border-bottom-left-radius: 10px;
       }
       #custom-reboot {
        border-top-right-radius:    10px;
        border-bottom-right-radius: 10px;
	padding-right:              17.5px;
       }
    
       /* Workspaces */
       #workspaces button {
        opacity:       0.5;
        padding-left:  5px;
        border-radius: 10px;
        padding-right: 15px;
        background:    none;
        color:         @text
       }
       #workspaces button.urgent {
        opacity:       0.8;
        padding-left:  5px;
        border-radius: 10px;
        padding-right: 15px;
        color:         @red;
        background:    @base;
       }
       #workspaces button.focused {
        opacity:       1;
        padding-left:  5px;
        border-radius: 10px;
        padding-right: 15px;
        color:         @text;
        background:    @base;
       }
    '';
    settings = [{
        height   = 10;
        layer    = "top";
        position = "top";

        modules-center = [ "sway/workspaces" ];
        modules-right  = [ "disk" "backlight" "pulseaudio" "clock" ];
        modules-left   = [ "custom/power" "custom/hibernate" "custom/reboot" "battery" "network" "sway/mode" ];

        "sway/workspaces" = {
          all-outputs  = true;
          format       = "{icon}";
          format-icons = {
            "1" = "<big></big>";
            "2" = "<big></big>";
            "3" = "<big></big>";
            "4" = "<big></big>";
          };
        };
	"disk" = {
	  interval = 60;
	  path     = "/";
          tooltip  = false;
	  format   = "  {percentage_used}%";
	};
        "backlight" = {
          tooltip        = false;
          format         = " {percent}%";
          on-scroll-up   = "exec light -A 1";
          on-scroll-down = "exec light -U 1";
        };
        "clock" = {
          interval = 30;
          tooltip  = false;
          format   = "{:  %d/%m/%y | %H:%M}";
        };
        "custom/power" = {
          tooltip  = false;
          on-click = "exec poweroff";
          format   = "<span foreground=\"#BF616A\"></span>";
        };
        "custom/hibernate" = {
          tooltip  = false;
          on-click = "systemctl suspend";
          format   = "<span foreground=\"#5E81AC\"></span>";
        };
        "custom/reboot" = {
          tooltip  = false;
          on-click = "exec reboot";
          format   = "<span foreground=\"#EBCB8B\"></span>";
        };
        "pulseaudio" = {
          scroll-step = 1;
          format-icons = {
            headphone = "";
            default   = ["" "" ""];
          };
          on-click = "kitty zsh -c 'pulsemixer'";
          format = "<span font=\"Line-Awesome\">{icon}</span>  {volume}%";
        };
        "battery" = {
          interval                   = 5;
          bat                        = "BAT0";
          format-icons               = ["" "" "" "" ""];
          tooltip-format-charging    = "Full Charge Duration: {time}";
          tooltip-format-discharging = "Discharging Duration: {time}";
          format-charging            = "<span foreground=\"#EBCB8B\"></span>";
          format                     = "<span foreground=\"#A3BE8C\">{icon}</span>";
        };
	      "network" = {
          on-click                = "kitty zsh -c 'nmtui'";
          format-disconnected     = "<span foreground=\"#BF616A\"></span>";
	        format-wifi             = "<span foreground=\"#A3bE8C\"></span>";
	        format-ethernet         = "<span foreground=\"#A3BE8C\"></span>";
          tooltip-format-ethernet = "  {ifname}\nIP: {ipaddr}\n<span font=\"Line-Awesome\"></span> {bandwidthUpBits} <span font=\"Line-Awesome\"></span> {bandwidthDownBits}";
          tooltip-format-wifi     = "  {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFrequency: {frequency}MHz\n<span font=\"Line-Awesome\"></span> {bandwidthUpBits} <span font=\"Line-Awesome\"></span> {bandwidthDownBits}";
        };
     }];
   };
 };
}
