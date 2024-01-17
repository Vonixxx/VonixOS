###########
# VonixOS #
########################
# Waybar Configuration #
########################
{ ... }:

{
 programs.light.enable = true;

 home-manager.users.vonix.programs = {
   waybar = {
    enable = true;

    style = lib.mkDefault '' 
       /* Colors */
       @define-color power            #F38BA8;
       @define-color sleep            #89B4FA;
       @define-color reboot           #F9E2AF;
       @define-color battery          #A6E3A1;
       @define-color network          #89DCEB;
       @define-color backlight        #F9E2AF;
       @define-color pulseaudio       #CBA6F7;
       @define-color foreground       #CDD6F4;
       @define-color background1      #11111B;
       @define-color background3      #1E1E2E;
       @define-color urgentBackground #1E1E2E;
       @define-color urgentForeground #F38BA8;


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
        padding:    2px 12px;
        color:      @foreground;
        background: @background1;
       }
 

       /* Icon Color */
       #battery {
        color:      @battery;
        background: @background1;
       }

       #network {
        color:      @network;
        background: @background1;
       }

       #backlight {
        color:      @backlight;
        background: @background1;
       }

       #pulseaudio {
        color:      @pulseaudio;
        background: @background1;
       }

       #custom-sleep {
        color:      @sleep;
        background: @background3;
       }

       #custom-power {
        color:      @power;
        background: @background3;
       }

       #custom-reboot {
        color:      @reboot;
        background: @background3;
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

       #workspaces button {
        padding-right: 20px;
       }

       #custom-power, 
       #custom-reboot {
        padding-right: 14px;
       }

       #pulseaudio { 
        padding-right: 17.5px;
       }

 
       /* Workspaces */
       #workspaces button {
        opacity:    0.5;
        background: none;
        color:      @foreground;
       }

       #workspaces button.urgent {
        opacity:    0.8;
        background: @urgentBackground;
        color:      @urgentForeground;
       }
    '';

    settings = lib.mkDefault [{
        height        = 55;
        layer         = "top";
        position      = "top";
        modules-right = [ "disk" "memory" "clock" ];

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
