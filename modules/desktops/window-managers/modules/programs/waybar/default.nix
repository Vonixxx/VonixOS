###########
# VonixOS #
########################
# Waybar Configuration #
########################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.waybar = {
    enable = true;
    style = '' 
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
       background:  rgba(0,0,0,0);
       font-family: '${vars.font}';
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
      #custom-sleep,
      #custom-power,
      #custom-reboot {
       padding:    2px 12px;
       color:      ${vars.waybar.foreground};
       background: ${vars.waybar.background};
      }

      /* Icon Color */
      #custom-sleep {
       color: ${vars.waybar.sleep};
      }
      #custom-power {
       color: ${vars.waybar.power};
      }
      #custom-reboot {
       color: ${vars.waybar.reboot};
      }
      #battery {
       color: ${vars.waybar.battery};
      }
      #network {
       color: ${vars.waybar.network};
      }

      /* Icon Position Fix */
      #network { 
       padding-right: 20px;
      }
      #workspaces button {
       padding-right: 20px;
      }
      #custom-sleep {
       padding-right: 15px;
      }
      #custom-power,
      #custom-reboot {
       padding-right: 12.5px;
      }

      /* Workspaces */
      #workspaces button {
       opacity:    0.5;
       background: none;
       color:      ${vars.waybar.foreground};
      }
      #workspaces button.focused {
       opacity:    1;
       background: ${vars.waybar.background};
      }
      #workspaces button.urgent {
       opacity:    0.8;
       background: ${vars.waybar.urgentBackground};
       color:      ${vars.waybar.urgentForeground};
      }
    '';
    settings = [{
        height   = 55;
        layer    = "top";
        position = "top";

        modules-center = [ "sway/workspaces" ];
        modules-right  = [ "pulseaudio" "backlight" "disk" "clock" ];
        modules-left   = [ "custom/power" "custom/reboot" "custom/sleep" "battery" "network" "sway/mode" ];

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
	  format-ethernet     = "<big>󰈀</big>";
	  format-wifi         = "<big>󰤨</big>";
          format-disconnected = "<big>󰤭</big>";
          on-click            = "kitty zsh -c 'nmtui'";
        };
        "battery" = {
          interval                   = 5;
          bat                        = "BAT0";
          format-charging            = "<big>󰂄</big>";
          format                     = "<big>{icon}</big>";
          format-icons               = ["󰁻" "󰁽" "󰁿" "󰂁" "󰁹"];
          tooltip-format-charging    = "Full Charge Duration: {time}";
          tooltip-format-discharging = "Discharging Duration: {time}";
        };
     }];
   };
 };
}
