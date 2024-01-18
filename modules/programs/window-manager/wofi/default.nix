###########
# VonixOS #
######################
# Wofi Configuration #
######################
{ ... }:

{
 home-manager.users.vonix.programs = {
   wofi = {
     enable = true;

     settings = {
       lines        = 5;
       width        = 250;
       allow_markup = true;
       hide_scroll  = true;
       show         = "run";
       prompt       = "Launch:";
     };

     style = '' 
        @define-color base              #181825;
        @define-color baseAlt           #1E1E2E;
        @define-color text              #CDD6F4;
        @define-color border            #CBA6F7;
        @define-color textBox           #313244;
        @define-color selectedText      #11111B;
        @define-color selectedHighlight #9399B2;
         
        #text {
         padding: 5px;
         color:   @text;
        }
         
        #entry {
         padding:       10px;
         border-radius: 10px;
        }

        #inner-box {
         background-color: @base;
        }

        #outer-box {
         margin:            3px;
         padding:           10px;
         border-radius:     10px;
         background-color:  @base;
        }
         
        #entry:nth-child(even) {
         background-color: @baseAlt;
        }
         
        * {
         font-size:   15px;
         font-family: "CascadiaCode";
        }
         
        #window {
         border-radius: 10px;
         border:        3px solid @border;
        }
         
        #input {
         padding:          5px;
         border-radius:    5px;
         margin-bottom:    15px;
         color:            @text;
         background-color: @textBox;
         border:           3px solid @border;
        }

        #entry:selected {
         color:            @selectedText;
         background-color: @selectedHighlight;
        }
     '';
   };
 };
}
