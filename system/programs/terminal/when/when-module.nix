###########
# VonixOS #
######################
# When Configuration #
######################
{ lib, config, unstable, home-manager, ... }:

with hm;
with lib;
with types;
with unstable;
with maintainers;

let 
 cfg = config.programs.when; 
in 

{
 options.programs.when = {
   meta.maintainers = [ vonixxx ];
   enable           = mkEnableOption "when";
   package          = mkPackageOption unstable "when" { };

   preferences = mkOption {
     default = { };
     type    = attrsOf (oneOf [ int str ]);

     example = literalExpression ''
        {
         styled_output = 1; # 1/0 = True/False
         future        = 14;
         language      = "en";
        }
     '';
     description = ''
        Configuration for .when/preferences
         See <https://www.lightandmatter.com/when/when.html>
         for options.
     '';
   };

   calendar = mkOption {
     default = "";
     type    = lines;

     example = literalExpression ''
        {
         * dec 25     , Christmas
         m=dec & d=25 , Christmas
         w=sat & b=1  , Rehearse with band.
         2003 feb 3   , Fly to Stockholm to accept Nobel Prize.
        }
     '';
     description = ''
        Configuration for .when/calendar
         See <https://www.lightandmatter.com/when/when.html>
         for options.
     '';
   };
 };

 config = mkIf cfg.enable {
   home.packages = [ cfg.package ];

   xdg.configFile.".when/calendar" = mkIf (cfg.calendar != null) { 
     text = writeText ".when/calendar" cfg.calendar;
   };

   xdg.configFile.".when/preferences" = mkIf (cfg.preferences != { }) { 
     text = writeText ".when/preferences" cfg.preferences;
   };
 };
}
