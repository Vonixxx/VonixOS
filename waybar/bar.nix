###########
# VonixOS #
#####################
# Bar Configuration #
#####################
{ config, pkgs, ... }:

{
 home-manager.users.vonix = { pkgs, ... }: {
   programs.waybar = {
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
            "1" = "<big><span font=\"Line-Awesome\"></span></big>";
            "2" = "<big><span font=\"Line-Awesome\"></span></big>";
            "3" = "<big><span font=\"Line-Awesome\"></span></big>";
            "4" = "<big><span font=\"Line-Awesome\"></span></big>";
          };
        };
        "backlight" = {
          tooltip        = false;
          on-scroll-up   = "exec light -A 2";
          on-scroll-down = "exec light -U 2";
          format         = "<span font=\"Line-Awesome\"></span> {percent}%";
        };
	"disk" = {
	 interval = 60;
	 path     = "/";
         tooltip  = false;
	 format   = "<span font=\"Line-Awesome\"></span>  {percentage_used}%";
	};
        "clock" = {
         interval = 30;
         tooltip  = false;
         format   = "<span font=\"Line-Awesome\">{:  %d/%m/%y    %H:%M}</span>";
        };
        "custom/power" = {
          tooltip  = false;
          on-click = "exec poweroff";
          format   = "<span foreground=\"#FF5F5F\" font=\"Line-Awesome\"></span>";
        };
        "custom/hibernate" = {
          tooltip  = false;
          on-click = "systemctl hibernate";
          format   = "<span foreground=\"#338FFF\" font=\"Line-Awesome\"></span>";
        };
        "custom/reboot" = {
          tooltip  = false;
          on-click = "exec reboot";
          format   = "<span foreground=\"#EFEF00\" font=\"Line-Awesome\"></span>";
        };
        "pulseaudio" = {
          scroll-step = 5;
          format-icons = {
            headphone = "";
            default   = ["" "" ""];
          };
          format = "<span font=\"Line-Awesome\">{icon}</span>  {volume}%";
          on-click = "kitty --hold zsh -c 'pulsemixer'; pkill -SIGRTMIN+8 waybar";
        };
        "battery" = {
          states = {
            warning  = 30;
            critical = 15;
          };
          interval                   = 5;
          bat                        = "BAT0";
          format-icons               = ["" "" "" "" ""];
          tooltip-format-charging    = "Full Charge Duration: {time}";
          tooltip-format-discharging = "Discharging Duration: {time}";
          format-charging            = "<span foreground=\"#FFFF00\" font=\"Line-Awesome\"></span>";
          format                     = "<span foreground=\"#44DF44\" font=\"Line-Awesome\">{icon}</span>";
        };
	"network" = {
          on-click                = "kitty --hold zsh -c 'nmtui'; pkill -SIGRTMIN+8 waybar";
	  format-wifi             = "<span foreground=\"#44DF44\" font=\"Line-Awesome\"></span>";
	  format-ethernet         = "<span foreground=\"#44DF44\" font=\"Line-Awesome\"></span>";
          format-disconnected     = "<span foreground=\"#FF5F5F\" font=\"Line-Awesome\"></span>";
          tooltip-format-ethernet = "<span font=\"Line-Awesome\"></span> {ifname}\nIP: {ipaddr}\n<span font=\"Line-Awesome\"></span> {bandwidthUpBits} <span font=\"Line-Awesome\"></span> {bandwidthDownBits}";
          tooltip-format-wifi     = "<span font=\"Line-Awesome\"></span>  {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFrequency: {frequency}MHz\n<span font=\"Line-Awesome\"></span> {bandwidthUpBits} <span font=\"Line-Awesome\"></span> {bandwidthDownBits}";
        };
     }];
   };
 };
}
