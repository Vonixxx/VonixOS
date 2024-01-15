{ pkgs, ... }:

{ 
 imports = [ ./configuration/default.nix ];

 programs.zsh.enable    = true;
 users.defaultUserShell = with pkgs; zsh;
 environment.shells     = with pkgs; [ zsh ];
}
