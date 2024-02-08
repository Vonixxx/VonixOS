{ lib
, config
, unstable
, home-manager
, ...
}:

with lib;                      
with types;
with unstable;
with maintainers;

let
  cfg = config.programs.when;
in {
 options.programs.when = {
   meta.maintainers = [ vonixxx ];
   enable           = mkEnableOption "when";

   package = mkPackageOption unstable "when" { };

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

     description = ''
        Configuration for .when/calendar
         See <https://www.lightandmatter.com/when/when.html>
         for options.
     '';
   };
 };

 config = mkIf cfg.enable {
   home.packages = [ cfg.package ];

   assertions = [ (hm.assertions.assertPlatform "programs.when" unstable platforms.linux) ];

   xdg.configFile.".when/calendar" = mkIf (cfg.calendar != null) { 
     text = writeText ".when/calendar" cfg.calendar;
   };

   xdg.configFile.".when/preferences" = mkIf (cfg.preferences != { }) { 
     text = writeText ".when/preferences" cfg.preferences;
   };
 };
}
