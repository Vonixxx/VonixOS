###########
# VonixOS #
#####################
# CSS Configuration #
#####################
{ config, pkgs, ... }:

{
 ############
 # Imports #
 ##########
 imports = [
   ../home-manager/default.nix
 ];


 #######
 # CSS #
 #######
 home-manager.users.vonix = { pkgs, ... }: {
   programs.waybar = {
     style = ''
        /* Colors */
	@define-color base     #0C090A;
        @define-color text     #FFFFFF;
        @define-color warning  #DB7B5F;
        

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
        
        #clock {
         margin-left:   5px;
         border-radius: 10px;
        }

        #disk {
         margin-right:  5px;
         border-radius: 10px;
        }

        #network,
        #battery {
         margin-left:   5px;
         border-radius: 10px;
         padding-right: 20px;
        }

        #custom-power,
        #custom-reboot,
        #custom-hibernate {
         padding-right: 15px;
        }

        #backlight,
        #custom-power {
         border-top-left-radius:    10px;
         border-bottom-left-radius: 10px;
        }

        #pulseaudio,
        #custom-reboot {
         border-top-right-radius:    10px;
         border-bottom-right-radius: 10px;
        }


        /* Critical */
        #battery.critical {
         color: @red;
        }

        
        /* Warning */
        #battery.warning {
         color: @warning;
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
   };
 };
}
