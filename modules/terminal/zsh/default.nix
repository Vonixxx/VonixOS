{ pkgs, ... }:

{ 
 imports = [ ./configuration/default.nix ];

 users.defaultUserShell = with pkgs; zsh;
 environment.shells     = with pkgs; [ zsh ];
}
