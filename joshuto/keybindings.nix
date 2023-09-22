###########
# VonixOS #
#############################
# Keybindings Configuration #
#############################
{ config, pkgs, ... }:

{
 ###########
 # Imports #
 ###########
 imports = [
   ../home-manager/default.nix
 ];


 ###############
 # Keybindings #
 ###############
 home-manager.users.vonix = { pkgs, ... }: {
   programs.joshuto = {
     keymap = {
       default_view = {
         keymap = [
           #############
           # Searching #
           #############
           { keys = ["/"]; command = ":search"; }
           { keys = ["n"]; command = "search_next"; }
           { keys = ["N"]; command = "search_prev"; }
           ##############
           # Navigation #
           ##############
           { keys = ["l"]; command = "open"; }
           { keys = ["h"]; command = "cd .."; }
           { keys = ["k"]; command = "cursor_move_up"; }
           { keys = ["j"]; command = "cursor_move_down"; }
           #################
           # Copy & Delete #
           #################
           { keys = ["d" "d"]; command = "cut_files"; }
           { keys = ["y" "y"]; command = "copy_files"; }
           { keys = ["p"];     command = "paste_files"; }
           { keys = ["D"];     command = "delete_files"; }
           ############
           # Renaming #
           ############
           { keys = ["c" "w"]; command = ":rename"; }
           { keys = ["b" "b"]; command = "bulk_rename"; }
           { keys = ["a"];     command = "rename_append"; }
           { keys = ["A"];     command = "rename_append"; }
           ##################
           # Shell Commands #
           ##################
           { keys = ["t"];     command = ":touch"; }
           { keys = ["m" "k"]; command = ":mkdir"; }
           { keys = ["e"];     command = "shell nvim %s"; }
           #############
           # Shortcuts #
           #############
           { keys = ["q"];      command = "quit"; }
           { keys = ["ctrl+v"]; command = "toggle_visual"; }
           { keys = ["G" "G"];  command = "cursor_move_end"; }
           { keys = ["g" "g"];  command = "cursor_move_home"; }
           ##########################
           # File Manager Functions #
           ##########################
           { keys = ["ctrl+t"];    command = "new_tab"; }
           { keys = ["ctrl+w"];    command = "close_tab"; }
           { keys = ["ctrl+h"];    command = "toggle_hidden"; }
           { keys = ["backspace"]; command = "tab_switch -1"; }
         ];
       };
       task_view = {
         keymap = [
           ##################
           # Shell Commands #
           ##################
           { keys = ["e"]; command = "shell nvim %s"; }
           ##############
           # Navigation #
           ##############
           { keys = ["k"]; command = "cursor_move_up"; }
           { keys = ["j"]; command = "cursor_move_down"; }
           #############
           # Shortcuts #
           #############
           { keys = ["G" "G"]; command = "cursor_move_end"; }
           { keys = ["g" "g"]; command = "cursor_move_home"; }
         ];
       };
       help_view = {
         keymap = [
           { keys = ["k"]; command = "cursor_move_up"; }
           { keys = ["j"]; command = "cursor_move_down"; }
           { keys = ["e"]; command = "shell nvim -E %s"; }
           { keys = ["G" "G"]; command = "cursor_move_end"; }
           { keys = ["g" "g"]; command = "cursor_move_home"; }
         ];
       };
     };
   };
 };
}
