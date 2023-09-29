###########
# VonixOS #
#########################
# Joshuto Configuration #
#########################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.joshuto = {
     ##########
     # Enable #
     ##########
     enable = true;
     ####################
     # General Settings #
     ####################
     settings = {
       scroll_offset = 5;
       watch_files   = true;
       xdg_open      = false;
       use_trash     = false;
       tab = {
         display_mode = "all";
         home_page    = "root";
       };
       preview = {
         max_preview_size = 2097152;     
         preview_script   = ./preview.sh;
       };
       display.sort = {
         directories_first = true;
         case_sensitive    = false;
         reverse           = false;
         sort_method       = "natural";
       };
       display = {
         show_icons        = true;
         tilde_in_titlebar = true;
         show_hidden       = false;
         collapse_preview  = false;
         show_borders      = false;
         linemode          = "all";
         line_number_style = "none";
         column_ratio      = [1 3 4];
         mode              = "default";
       };
       search = {
         fzf_case_sensitivity    = "smart";
         glob_case_sensitivity   = "smart";
         regex_case_sensitivity  = "smart";
         string_case_sensitivity = "smart";
       };
     };
     ###############
     # Keybindings #
     ###############
     keymap = {
       ################
       # Default View #
       ################
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
       #############
       # Task View #
       #############
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
       #############
       # Help View #
       #############
       help_view = {
         keymap = [
           ##################
           # Shell Commands #
           ##################
           { keys = ["e"]; command = "shell nvim -E %s"; }
	   ##############
	   # Navigation #
	   ##############
           { keys = ["k"]; command = "cursor_move_up"; }
           { keys = ["j"]; command = "cursor_move_down"; }
           { keys = ["G" "G"]; command = "cursor_move_end"; }
           { keys = ["g" "g"]; command = "cursor_move_home"; }
         ];
       };
     };
   };
 };
}
