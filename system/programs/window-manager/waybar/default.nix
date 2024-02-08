###########
# VonixOS #
########################
# Waybar Configuration #
########################
{ lib
, config
, ...
}: 

with lib;
with config;

{
 config = mkIf (window-manager.enable) {
   programs.light.enable = true;

   home-manager.users.vonix.programs = {
     waybar = {
      enable = true;
  
      style = '' 
         /* Colors */
         @define-color red       #F38BA8;
         @define-color teal      #89DCEB;
         @define-color blue      #89B4FA;
         @define-color mauve     #CBA6F7;
         @define-color white     #CDD6F4;
         @define-color green     #A6E3A1;
         @define-color mantle    #181825;
         @define-color yellow    #F9E2AF;
         @define-color rosewater #F5E0DC;
  
  
         /* Base */
         * {
          min-height:    0px;
          border-radius: 0px;
          padding:       0px;
          border:        none;
          margin:        1px 1px 1px 1px;
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
          color:   @white;
          padding: 2px 12px;
         }
   
   
         /* Whole Bar */
         #waybar {
          font-size:     20px;
          border-radius: 20px;
          font-weight:   bold;
          background:    @mantle;
          font-family:   CascadiaCode;
         }
       
  
         /* Workspaces */
         #workspaces button.urgent {
          margin-bottom: 0px;
          color:         @red;
          border-bottom: 3px solid @red;
         }
  
         #workspaces button.active {
          margin-bottom: 0px;
          color:         @mauve;
          border-bottom: 3px solid @mauve;
         }
  
         #workspaces button {
          margin-bottom: 0px;
          color:         @white;
          border-bottom: 3px solid @white;
         }
  
  
         /* Icon Color */
         #custom-power  { color: @red; }
         #network       { color: @teal; }
         #custom-sleep  { color: @blue; }
         #battery       { color: @green; }
         #pulseaudio    { color: @mauve; }
         #custom-reboot { color: @yellow; }
         #backlight     { color: @rosewater; }
  
  
         /* Icon Position Fix */
         #workspaces button {
          margin-right:  5px;
          padding-left:  10px;
          padding-right: 15px;
         }
  
         #network       { padding-right: 20px; }
         #backlight     { padding-right: 20px; }
         #custom-sleep  { padding-right: 16px; }
         #custom-power, 
         #custom-reboot { padding-right: 13px; }
         #pulseaudio    { padding-right: 17.5px; }
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
            on-click       = "foot pulsemixer";
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
 };
}
