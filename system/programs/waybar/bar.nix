###########
# VonixOS #
#####################
# Bar Configuration #
#####################
{ ... }:

{
 home-manager.users.vonix.programs = {
   waybar = {
    settings = [{
        height         = 45;
        layer          = "top";
        position       = "top";
        modules-right  = [ "disk" "clock" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-left   = [ "custom/power" "custom/reboot" "custom/sleep" "battery" "backlight" "network" "pulseaudio" ];

        "hyprland/workspaces" = {
          all-outputs = true;
          format      = "{icon}";

          persistent-workspaces = {
            "1" = "[]";
            "2" = "[]";
            "3" = "[]";
            "4" = "[]";
            "5" = "[]";
          };

          format-icons = {
            "1" = "<big>󰖟</big>";
            "2" = "<big>󰆍</big>";
            "3" = "<big>󱤙</big>";
            "4" = "<big>󰭣</big>";
            "5" = "<big>󰔂</big>";
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

        "pulseaudio" = {
          format-icons = {
            headphone = "󰋋";
            default   = [ "󰖁" "󰕿" "󰖀" "󰕾" ];
          };
        };

        "disk" = {
          path     = "/";
          interval = 3600;
          tooltip  = false;
          format   = "󰋊 [{percentage_used}%]";
        };

        "clock" = {
          interval = 30;
          tooltip  = false;
          format   = "󰸗 [{:%d/%m/%y - %H:%M}]";
        };

        "backlight" = {
          tooltip        = false;
          format-icons   = [ "󰃞" "󰃟" "󰃠" ];
          on-scroll-up   = "exec light -A 1";
          on-scroll-down = "exec light -U 1";
          format         = "<big>{icon}</big>";
        };

        "network" = {
          tooltip             = false;
          format-wifi         = "<big>󰤨</big>";
          format-ethernet     = "<big>󰤪</big>";
          format-disconnected = "<big>󰤭</big>";
          on-click            = "foot nmtui connect";
        };

        "pulseaudio" = {
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
}
