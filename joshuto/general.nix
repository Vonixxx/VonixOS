###########
# VonixOS #
#########################
# General Configuration #
#########################
{ config, pkgs, ... }:

{
 home-manager.users.vonix = { pkgs, ... }: {
   programs.joshuto = {
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
   };
 };
}
