{ vars, ... }

{
 users = {
   mutableUsers     = false;
   defaultUserShell = with pkgs; zsh;

   users.${vars.user} = {
     uid          = 1000;
     isNormalUser = true;
     home         = "/home/vonix";
     password     = "${unknown-vars.password}";
     extraGroups  = [ "audio" "video" "wheel" "libvirtd" ];
   };
 };
}
