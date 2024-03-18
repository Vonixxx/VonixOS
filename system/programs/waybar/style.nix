###########
# VonixOS #
#######################
# Style Configuration #
#######################
{ ... }:

{
 home-manager.users.vonix.programs = {
   waybar = {
     style = '' 
        /* Colors */
        @define-color red    #F38BA8;
        @define-color blue   #89B4FA;
        @define-color mauve  #CBA6F7;
        @define-color white  #CDD6F4;
        @define-color green  #A6E3A1;
        @define-color crust  #11111B;
        @define-color yellow #F9E2AF;


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
        #custom-sleep,
        #custom-power,
        #custom-reboot {
         color:   @white;
         padding: 2px 12px;
        }


        /* Base */
        * {
         min-height:    0px;
         border-radius: 0px;
         padding:       0px;
         border:        none;
         margin:        1px 1px 1px 1px;
        }


        /* Whole Bar */
        #waybar {
         font-size:     20px;
         font-weight:   bold;
         border-radius: 50px;
         background:    @crust;
         font-family:   CascadiaCode;
         border-top:    3px solid @mauve;
         border-bottom: 3px solid @mauve;
        }


        /* Icon Color */
        #custom-power  { color: @red; }
        #network       { color: @blue; }
        #custom-sleep  { color: @blue; }
        #battery       { color: @green; }
        #pulseaudio    { color: @mauve; }
        #custom-reboot { color: @yellow; }
        #backlight     { color: @yellow; }


        /* Icon Position */
        #network      { margin-right: -3px; }
        #backlight    { margin-right: -4px; }
        #cpu          { margin-right: -10px; }
        #disk         { margin-right: -10px; }
        #memory       { margin-right: -10px; }
        #battery      { margin-right: -12px; }
        #custom-sleep { margin-right: 7.5px; }


        /* Workspaces */
        #workspaces button { 
         margin-left:  10px;
         margin-right: 10px;
         color:        @white; 
        }
        #workspaces button.urgent { color: @red; }
        #workspaces button.active { color: @mauve; }
     '';
   };
 };
}
