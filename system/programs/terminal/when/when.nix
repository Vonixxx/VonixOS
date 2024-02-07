{ lib, pkgs, config, ... }:

with lib;                      
with pkgs;
with types;

let
  cfg = config.services.hello;
in {
 options.programs.when = {
   enable  = mkEnableOption "when";
   package = mkPackageOption pkgs "when" { };

   preferences = mkOption {
     default = { };
     type    = attrsOf (oneOf [ int str ]);

     example = {
       styled_output = 1; # 1/0 = True/False
       future        = 14;
       language      = "en";
     };
     description = ''
        Configuration for .when/preferences
         See <https://www.lightandmatter.com/when/when.html>
         for options.
     '';
   };

   calendar = mkOption {
     default = "";
     type    = lines;

     description = ''
        Configuration for .when/calendar
         See <https://www.lightandmatter.com/when/when.html>
         for options.
     '';
   };
 };

 config = mkIf cfg.enable {
   home.packages = [ cfg.package ];

   xdg.configFile = {
     ".when/calendar" = mkIf (cfg.calendar != null) { 
       writeText ".when/calendar" cfg.calendar;
     };

     ".when/preferences" = mkIf (cfg.preferences != { }) { 
       text = finalConfig; 
     };
   };
 };
}
