###########
# VonixOS #
#################
# Programs List #
#################
{ lib, config, ... }: with lib;

{
 options = {
   generic.enable = mkOption {
     default = false;
     type    = types.bool;
   };

   terminal.enable = mkOption {
     default = false;
     type    = types.bool;
   };

   recording.enable = mkOption {
     default = false;
     type    = types.bool;
   };

   window-manager.enable = mkOption {
     default = false;
     type    = types.bool;
   };
 };

 config = mkMerge [ 
   (mkIf config.terminal.enable {
     imports = [
       ./terminal/bat/default.nix
       ./terminal/git/default.nix
       ./terminal/lsd/default.nix
       ./terminal/mpv/default.nix
       ./terminal/zsh/default.nix
       ./terminal/foot/default.nix
       ./terminal/helix/default.nix
       ./terminal/sioyek/default.nix
     ];
   })

   (mkIf config.generic.enable {
     imports = [
       ./generic/firefox/default.nix
     ];
   })

   (mkIf config.recording.enable {
     imports = [
       ./recording/kdenlive-obs/default.nix
     ];
   })

   (mkIf config.terminal.enable {
     imports = [
       ./window-manager/wofi/default.nix
       ./window-manager/mako/default.nix
       ./window-manager/cursor/default.nix
       ./window-manager/waybar/default.nix
       ./window-manager/wpaperd/default.nix
       ./window-manager/gammastep/default.nix
     ];
   })
 ];
}
