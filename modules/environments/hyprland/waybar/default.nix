###########
# VonixOS #
########################
# Waybar Configuration #
########################
{ ... }:

{
 home-manager.users.vonix.programs = {
   waybar = {
    enable = true;

    style = '' 
       /* Colors */
       @define-color power      #F38BA8;
       @define-color sleep      #89B4FA;
       @define-color reboot     #F9E2AF;
       @define-color battery    #A6E3A1;
       @define-color network    #89DCEB;
       @define-color backlight  #F9E2AF;
       @define-color pulseaudio #CBA6F7;

       @define-color foreground #CDD6F4;
       @define-color background #11111B;

       @define-color active     #CBA6F7;
       @define-color urgent     #F38BA8;
       @define-color inactive   #94E2D5;

       /* Base */
       * {
        min-height:    0px;
        border-radius: 0px;
        padding:       0px;
        border:        none;
        margin:        -1px 3px 3px;
       }
     

       /* Whole Bar */
       #waybar {
        font-size:     20px;
        border-radius: 20px;
        font-weight:   bold;
        color:         @text;
        background:    @background;
        font-family:   CascadiaCode;
       }
     

       /* Modules */
       #mode,
       #disk,
       #clock,
       #memory,
       #network,
       #battery,
       #backlight,
       #pulseaudio,
       #custom-sleep,
       #custom-power,
       #custom-reboot {
        padding: 2px 12px;
        color:   @foreground;
       }
 

       /* Icon Color */
       #battery {
        color: @battery;
       }

       #network {
        color: @network;
       }

       #backlight {
        color: @backlight;
       }

       #pulseaudio {
        color: @pulseaudio;
       }

       #custom-sleep {
        color: @sleep;
       }

       #custom-power {
        color: @power;
       }

       #custom-reboot {
        color: @reboot;
       }
 

       /* Icon Position Fix */
       #network { 
        padding-right: 20px;
       }

       #backlight {
        padding-right: 20px;
       }

       #custom-sleep {
        padding-right: 16px;
       }

       #custom-power, 
       #custom-reboot {
        padding-right: 13px;
       }

       #workspaces button {
        margin-right:  5px;
        padding-left:  10px;
        padding-right: 15px;
       }

       #pulseaudio { 
        padding-right: 17.5px;
       }

 
       /* Workspaces */
       #workspaces button.urgent {
        color:        @urgent;
        border-color: @urgent;
       }

       #workspaces button.active {
        border-bottom: 3px solid @active;
       }

       #workspaces button {
        border-bottom: 3px solid @inactive;
       }
    '';

    settings = [{
        height   = 45;
        layer    = "top";
        position = "top";

        modules-center = [ "hyprland/workspaces" ];
        modules-right  = [ "disk" "memory" "clock" ];
        modules-left   = [ "custom/power" "custom/reboot" "custom/sleep" "backlight" "pulseaudio" "network" "battery" ];

        "hyprland/workspaces" = {
          all-outputs = true;
          format      = "{icon}";

          persistent-workspaces = {
            "1" = "[]";
            "2" = "[]";
            "3" = "[]";
            "4" = "[]";
          };

          format-icons = {
            "1" = "<big>󰜏</big>";
            "2" = "<big>󰆍</big>";
            "3" = "<big>󰭣</big>";
            "4" = "<big>󰯜</big>";
          };
        };

        "memory" = {
          interval = 10;
          tooltip  = false;
          format   = "󱉟 {percentage}%";
        };

        "custom/reboot" = {
          tooltip  = false;
          format   = "<big>󰜉</big>";
          on-click = "systemctl reboot";
        };

        "custom/sleep" = {
          tooltip  = false;
          format   = "<big>󰜗</big>";
          on-click = "systemctl suspend";
        };

        "custom/power" = {
          tooltip  = false;
          format   = "<big>󰐥</big>";
          on-click = "systemctl poweroff";
        };

      	"disk" = {
      	  interval = 60;
      	  path     = "/";
          tooltip  = false;
      	  format   = "󰋊 {percentage_used}%";
      	};

        "clock" = {
          interval = 30;
          tooltip  = false;
          format   = "{:󰃭 %d/%m/%y | %H:%M}";
        };

	      "network" = {
          tooltip             = false;
          on-click            = "foot nmtui";
      	  format-ethernet     = "<big>󰤪</big>";
      	  format-wifi         = "<big>󰤨</big>";
          format-disconnected = "<big>󰤭</big>";
        };

        "backlight" = {
          tooltip        = false;
          on-scroll-up   = "exec light -A 1";
          on-scroll-down = "exec light -U 1";
          format         = "<big>{icon}</big>";
          format-icons   = [ "󱩏" "󱩑" "󱩓" "󱩕" "󰛨" ];
        };

        "pulseaudio" = {
          format-icons = {
            headphone = "󰋋";
            default   = [ "󰖁" "󰕿" "󰖀" "󰕾" ];
          };

          tooltip        = false;
          format         = "<big>{icon}</big>";
          on-scroll-up   = "exec amixer -q sset Master 1%+";
          on-scroll-down = "exec amixer -q sset Master 1%-";
        };

        "battery" = {
          interval                   = 5;
          bat                        = "BAT0";
          format-charging            = "<big>󰂄</big>";
          format                     = "<big>{icon}</big>";
          tooltip-format-charging    = "Full Charge: {time}";
          format-icons               = [ "󰁻" "󰁽" "󰁿" "󰂁" "󰁹" ];
          tooltip-format-discharging = "Full Discharge: {time}";
        };
     }];
   };
 };
}
